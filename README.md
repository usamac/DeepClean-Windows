# DeepClean.bat – Ultimate Windows Cleanup Script

A batch script built for IT pros and Windows power users to deep clean Windows 10 and 11 systems. Automates common maintenance tasks like temp file deletion, prefetch cleanup, file explorer reset, and system file scanning.

---

## 💻 What It Does

### 🔁 App & File Lock Handling
- Kills common file-locking apps like Word, Excel, Chrome, Teams, etc.

### 🧹 Cleans System Junk
- `%temp%`
- `C:\Windows\Temp`
- `C:\Windows\Prefetch` *(with ownership and permission fixes)*
- `C:\Windows\SoftwareDistribution\Download`

### 🗂 File Explorer History Reset
- Clears:
  - Run history
  - Dialog paths
  - RecentDocs
  - File Explorer Home (Favorites & Recent)
  - Jump lists

### 🧰 OS Maintenance
- Deletes `Windows.old` (if present)
- Opens **Disk Cleanup** in admin mode
- Runs `sfc /scannow`

### 📝 Logging
- Saves a detailed log to your Desktop: `Cleanup_Log.txt`
- Logs all deletions, errors, and actions with timestamps

### 🔄 Optional Restart
- Prompts user to reboot with 10-second delay
- Skipping reboot opens log in Notepad

---

## ⚠️ Safe For Use On:
- Workstations
- Home PCs
- Shared machines
- Fresh installs or upgrades

## 🔒 Does Not Touch:
- Installed apps
- Pinned Quick Access
- Personal browser data or passwords

---

> Want to suggest improvements? Open a pull request or issue! This script is actively evolving with feedback from real-world IT usage.
