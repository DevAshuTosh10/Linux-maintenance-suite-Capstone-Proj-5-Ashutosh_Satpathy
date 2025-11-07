#!/bin/bash
# Final version of backup.sh with permission handling and exclusions

set -euo pipefail
LOGFILE="/var/log/maintenance-suite.log"
SOURCE="/etc /home"
DEST="/backup/daily"
DATE=$(date +%F_%H-%M-%S)
ARCHIVE="$DEST/backup_${DATE}.tar.gz"

log() { echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"; }

log "Running backup script..."

# Ensure destination exists
if [ ! -d "$DEST" ]; then
  log "[INFO] Creating backup directory: $DEST"
  sudo mkdir -p "$DEST"
  sudo chown "$USER:$USER" "$DEST"
fi

# Check free space (500MB min)
min_free_mb=500
avail_mb=$(df --output=avail -m "$DEST" | tail -1)
if [ "$avail_mb" -lt "$min_free_mb" ]; then
  log "[ERROR] Not enough free space ($avail_mb MB)"
  exit 3
fi

# Perform backup, skipping restricted files
if sudo tar --exclude=/etc/shadow \
             --exclude=/etc/gshadow \
             --exclude=/etc/sudoers \
             --exclude=/etc/ssl/private \
             -czf "$ARCHIVE" $SOURCE 2>>"$LOGFILE"; then
  log "[SUCCESS] Backup created successfully at: $ARCHIVE"
else
  log "[ERROR] tar command failed!"
  exit 4
fi

log "Backup completed successfully!"
exit 0

