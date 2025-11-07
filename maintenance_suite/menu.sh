#!/bin/bash
# ===========================================
# Enhanced System Maintenance Suite (v2.0)
# ===========================================

set -o errexit
set -o nounset
set -o pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$HOME/maintenance_logs"
mkdir -p "$LOG_DIR"
SUITE_LOG="$LOG_DIR/suite_$(date +%Y-%m-%d).log"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$SUITE_LOG"
}

while true; do
    clear
    echo "======================================"
    echo "        SYSTEM MAINTENANCE SUITE      "
    echo "======================================"
    echo "1. Run Backup"
    echo "2. Update and Clean System"
    echo "3. Monitor Logs"
    echo "4. View Suite Log"
    echo "5. Exit"
    echo "--------------------------------------"
    read -rp "Enter your choice [1-5]: " choice

    case $choice in
        1)
            log "Running backup script..."
            # run with sudo so backup can include protected files; backup script also handles exclusions
            if sudo "$DIR/backup.sh"; then
                log "Backup completed successfully."
            else
                log "Backup failed!"
            fi
            read -rp "Press Enter to continue..."
            ;;
        2)
            log "Starting system update & cleanup..."
            if sudo "$DIR/update.sh"; then
                log "System update & cleanup completed."
            else
                log "Update & cleanup failed!"
            fi
            read -rp "Press Enter to continue..."
            ;;
        3)
            log "Running log monitor..."
            if sudo "$DIR/logmonitor.sh"; then
                log "Log monitor completed."
            else
                log "Log monitor failed!"
            fi
            read -rp "Press Enter to continue..."
            ;;
        4)
            echo "------ SUITE LOG (last 200 lines) ------"
            tail -n 200 "$SUITE_LOG" || echo "No suite log yet."
            echo "-----------------------------------------"
            read -rp "Press Enter to continue..."
            ;;
        5)
            log "Exiting Maintenance Suite."
            exit 0
            ;;
        *)
            echo "Invalid choice! Try again."
            sleep 1
            ;;
    esac
done

