# 🧰 USAMAC ScriptVault

A growing collection of command-line tools and PowerShell scripts for maintaining, diagnosing, and cleaning Windows systems.

All tools are hand-built by [USAMAC](https://github.com/usamac) for personal and professional use. Each script is organized into its own folder with documentation and usage instructions.

---

## 📁 Current Tools

### 🧹 DeepClean
> A batch script that deeply cleans a Windows system — including temp files, logs, residual caches, and optional reboot.

📂 [`DeepClean`](./DeepClean)

---

### 🔎 SysSummary
> PowerShell scripts that generate system summary reports — one full, and one privacy-safe for public sharing.

📂 [`SysSummary`](./SysSummary)

- `SysSum.ps1` → Full system info (with MACs, BIOS, hostnames, usernames)
- `SysSum-Redac.ps1` → Redacted summary (safe for public sharing)
- Includes GPU driver version, timestamp, and more

---

## 🧭 How to Use

### 🔧 Running PowerShell Scripts
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\[ScriptName].ps1
