# DeepClean.bat – Windows Cleanup Script by USAMAC

![MIT License](https://img.shields.io/badge/license-MIT-green.svg)
![Windows](https://img.shields.io/badge/platform-Windows-blue)
![Batch Script](https://img.shields.io/badge/script-.bat-orange)

---

> ⚠️ Use at your own risk. This script is provided as-is with no guarantee. Always review and test before using in production environments.

## 🔧 What is DeepClean.bat?

A one-click batch script for **deep cleaning Windows 10 and 11** systems.  
Designed for IT professionals, technicians, and power users.

---

## ✅ What It Does

### 🔁 App & File Lock Handling
- Kills common file-locking apps: Word, Excel, Chrome, Teams, etc.

### 🧹 Cleans System Junk
- `%temp%`
- `C:\Windows\Temp`
- `C:\Windows\Prefetch` *(with ownership fix)*
- `C:\Windows\SoftwareDistribution\Download`

### 🗂 File Explorer History Reset
- Clears:
  - Run dialog
  - File Open/Save history
  - RecentDocs
  - Explorer Home (Favorites + Recents)
  - Jump list entries

### 🧰 OS Maintenance
- Deletes `Windows.old` if present
- Launches **Disk Cleanup** (admin)
- Runs `sfc /scannow`

### 📋 Logging
- Creates a log file:  
  `%UserProfile%\Desktop\Cleanup_Log.txt`
- Logs all actions, errors, and a final summary

### 🔁 Restart Prompt
- Offers a reboot at the end
- Skipping opens the log in Notepad

---

## 📦 Download

[👉 Click here to download the latest version (ZIP)](https://github.com/USAMAC/DeepClean-Windows/releases)

---

## 📜 License

Licensed under the [MIT License](LICENSE)  
(c) 2025 USAMAC
