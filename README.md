🧠 Linux Maintenance Suite (Capstone Project 5)
**Developer:** Ashutosh Satpathy  
**GitHub:** [DevAshuTosh10](https://github.com/DevAshuTosh10)  
**Course:** Linux OS & LSP  
**Project Type:** Bash Scripting Automation

---

📘 Project Overview
This project is a **Bash Scripting Suite for System Maintenance** that automates key administrative tasks such as:
- Automated system backups
- System updates and cleanup
- Log file monitoring for warnings or errors
- An interactive menu to run all tasks easily

The suite ensures efficient system maintenance and keeps detailed logs for every task performed.

---

🎯 Objectives
- Automate repetitive Linux maintenance operations  
- Reduce manual errors in backups and updates  
- Provide quick system status feedback via logs  
- Demonstrate Bash scripting, process automation, and error handling

---

🧩 Technologies Used

Bash Scripting

Linux Command-line

Cron Automation (optional)

System Administration Tools

🧩 Project Structure
linux-maintenance-suite/
│
├── backup.sh # Automates system backup with timestamp
├── update.sh # Updates and cleans the system
├── logmonitor.sh # Monitors system logs for warnings/errors
├── menu.sh # Interactive menu for the suite
└── maintenance_logs/ # Log directory (auto-created)


⚙️ Setup Instructions
1. Clone the Repository**

git clone https://github.com/DevAshuTosh10/Linux-maintenance-suite-Capstone-Proj-5-Ashutosh_Satpathy.git
cd Linux-maintenance-suite-Capstone-Proj-5-Ashutosh_Satpathy

2. Make Scripts Executable
chmod +x *.sh

3. Run the Suite
./menu.sh

4. Backup Directory

The backups will be stored in:

/backup/daily/

5. Logs

Logs for every session are stored under:

~/maintenance_logs/


Example Output
======================================
        SYSTEM MAINTENANCE SUITE
======================================
1. Run Backup
2. Update and Clean System
3. Monitor Logs
4. View Suite Log
5. Exit
--------------------------------------
Enter your choice [1-5]: 1
[2025-11-07 13:23:29] Running backup script...
[2025-11-07 13:23:29] [SUCCESS] Backup created successfully at: /backup/daily/backup_2025-11-07_13-23-29.tar.gz
[2025-11-07 13:23:29] Backup completed successfully.

🧠 Developer Note

This capstone project demonstrates:

Linux shell scripting for automation

File system management

Error handling and logging mechanisms

Clean modular design for maintainability

🏁 Conclusion

This project successfully automates core Linux maintenance tasks, improving efficiency and reliability for system administrators.
The structured design makes it easily extensible for advanced features like email alerts or remote monitoring.

© 2025 Ashutosh Satpathy
Linux OS & LSP — Capstone Project 5
