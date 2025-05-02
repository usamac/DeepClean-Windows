# 📄 SysSummary Scripts

![PowerShell](https://img.shields.io/badge/language-PowerShell-blue)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Type](https://img.shields.io/badge/tool-System%20Info-lightgrey)
![Built by USAMAC](https://img.shields.io/badge/Built%20by-USAMAC-black)

PowerShell tools that generate a system summary of hardware and OS details on Windows 10/11.

Each script saves a `.txt` report to your Desktop and automatically opens it in Notepad.

---

## 🔐 SysSum-Redac.ps1

> A **privacy-safe** system summary that redacts sensitive data.

✅ Includes:
- OS version, architecture, install date
- CPU, RAM, GPU, storage
- GPU driver version and date
- Motherboard info (no serials)
- Timestamp and timezone

❌ Redacts:
- Hostname
- MAC addresses
- BIOS serial numbers
- Logged-in username

📝 Output saved as: `SysSum-Redac.txt`

---

## 🧾 SysSum.ps1

> A **complete** system summary for internal or secure use.

✅ Includes everything in the redacted version **plus**:
- Hostname
- MAC addresses
- BIOS serial number
- Logged-in user
- Network adapter details

📝 Output saved as: `SysSum-Full.txt`

---

## ⚙️ How to Run (for both)

> Run from an elevated PowerShell window (Admin)

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\SysSum-Redac.ps1
