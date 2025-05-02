🪹 DeepClean.bat






A powerful Windows cleanup script that clears junk files, temp folders, residual caches, logs, and more — with an optional reboot prompt and cleanup log output.

⚙️ Features

Deletes contents of:

%TEMP%, SoftwareDistribution\Download, Prefetch, Windows.old, and more

Clears:

File Explorer history, quick access, custom recent items

Automates:

Disk Cleanup with /VERYLOWDISK and Start-Process trigger

Logs:

All actions and file/folder deletions to a timestamped .txt file on your Desktop

Reboot:

Prompts for system restart (optional)

🧳️ How to Use

Run as Administrator:

Right-click DeepClean.bat → Run as Administrator

🗂️ Output

A log file will be saved to the Desktop:

Named DeepClean_Log_[date-time].txt

Includes deleted files/folders and cleanup summary

Auto-opens if restart is declined

🧩 Compatibility

✅ Compatible with Windows 10 and 11❌ Not designed for Windows Server or legacy systems❌ Avoid running within 10 days of a clean install❌ Avoid running immediately after a major Windows upgrade (within 10-day rollback window)

