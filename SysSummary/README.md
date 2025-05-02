# SysSummary Tools

PowerShell scripts for collecting a system summary of hardware and OS details on Windows 10/11.

---

## 🔐 SysSum-Redac.ps1

Generates a privacy-safe system summary, excluding sensitive identifiers such as:

- Hostname
- MAC addresses
- BIOS serial numbers
- Product keys
- Logged-in username

📝 Output is saved as `SysSum-Redac.txt` on the current user's Desktop and auto-opens in Notepad.

### 📌 To run:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\SysSum-Redac.ps1
