# 🧹 DeepClean.bat

![Batch](https://img.shields.io/badge/language-Batchfile-blue)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)
![Tool Type](https://img.shields.io/badge/type-System%20Cleaner-green)
![Built by USAMAC](https://img.shields.io/badge/Built%20by-USAMAC-black)

DeepClean is a powerful Windows maintenance script that removes temporary files, logs, residual caches, `Windows.old`, and more. It includes an optional reboot prompt and generates a cleanup log.

---

## ⚙️ Features

- **Deletes contents of**:  
  `%TEMP%`, `SoftwareDistribution\Download`, `Prefetch`, `Windows.old`, etc.
- **Clears**:  
  File Explorer history, Quick Access, and custom recent items
- **Automates**:  
  Disk Cleanup via `/VERYLOWDISK` with `Start-Process`
- **Logs**:  
  Timestamped log file of all deletions, saved to Desktop
- **Reboot**:  
  Optional system restart prompt after cleaning

---

## 🏃 How to Use

Run as **Administrator**:

```cmd
Right-click DeepClean.bat → Run as Administrator
