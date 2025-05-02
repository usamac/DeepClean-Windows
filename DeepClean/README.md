# 🪹 DeepClean.bat

A powerful Windows cleanup script that clears junk files, temp folders, residual caches, logs, and more — with an optional reboot prompt and cleanup log output.

---

## ⚙️ Features

* **Deletes contents of**:
  `%TEMP%`, `SoftwareDistribution\Download`, `Prefetch`, `Windows.old`, etc.

* **Clears**:

  * File Explorer history
  * Quick access shortcuts
  * Custom recent items

* **Automates**:

  * Disk Cleanup via `/VERYLOWDISK` with `Start-Process`

* **Logs**:

  * Generates a timestamped `.txt` file on the Desktop
  * Includes counts of deleted files/folders and final cleanup summary

* **Reboot**:

  * Prompts the user with `choice`
  * Reboots system if accepted, or auto-opens log in Notepad if declined

---

## 🏃 How to Use

Run as Administrator:

```cmd
Right-click DeepClean.bat → Run as Administrator
```

---

## 🗂️ Output

A cleanup log will be saved to your Desktop:

* **Filename**: `DeepClean_Log_[date-time].txt`
* **Content**:

  * Full list of deleted files/folders
  * Cleanup summary including total files and folders removed
* **Behavior**:

  * Auto-opens in Notepad if the system reboot is declined

---

## 🧩 Compatibility

✅ Compatible with Windows 10 and 11
❌ Not designed for Windows Server or legacy systems
❌ Avoid running within 10 days of a clean install
❌ Avoid running immediately after a major Windows upgrade (within 10-day rollback window)

---

## 📌 Notes

* Safe for daily or weekly use
* Does not remove browser history, passwords, or UWP app data
* Uses built-in Windows commands only (no external tools or dependencies)

---

Let me know when you’re ready to generate a custom DeepClean banner, add an optional download `.zip`, or start v1.1 planning!

 
