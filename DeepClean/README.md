# 🧹 DeepClean.bat

![Batch](https://img.shields.io/badge/language-Batchfile-blue)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)
![Tool Type](https://img.shields.io/badge/type-System%20Cleaner-green)
![Built by USAMAC](https://img.shields.io/badge/Built%20by-USAMAC-black)

A powerful Windows cleanup script that clears junk files, temp folders, residual caches, logs, and more — with an optional reboot prompt and cleanup log output.

---

## ⚙️ Features

- Deletes contents of:
  - `%TEMP%`, `SoftwareDistribution\Download`, `Prefetch`, `Windows.old`, and more
- Clears:
  - File Explorer history, quick access, custom recent items
- Automates:
  - Disk Cleanup with `/VERYLOWDISK` and `Start-Process` trigger
- Logs:
  - All actions and file/folder deletions to a timestamped `.txt` file on your Desktop
- Reboot:
  - Prompts for system restart (optional)

---

## 🏃 How to Use

Run as Administrator:

```cmd
Right-click DeepClean.bat → Run as Administrator
