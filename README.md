![USAMAC ScriptVault Banner](./assets/banner2.png)
# 🧰 USAMAC ScriptVault

![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Language](https://img.shields.io/badge/language-PowerShell%20%7C%20Batch-blue)
![Status](https://img.shields.io/badge/status-Active-brightgreen)
![Built by USAMAC](https://img.shields.io/badge/Built%20by-USAMAC-black)

A growing collection of scripts for maintaining, diagnosing, and cleaning Windows systems. This is a live repository where tools are added, improved, and documented regularly.

---

## 📁 Current Tools

### 🧹 DeepClean
> A batch script that deeply cleans a Windows system — including temp files, logs, residual caches, and more. Supports logging and optional reboot prompt.

📂 [`DeepClean`](./DeepClean)

---

### 🔎 SysSummary
> PowerShell scripts that generate system summary reports — one full, and one privacy-safe for public sharing.

📂 [`SysSummary`](./SysSummary)

| Script Name           | Purpose                                  |
|-----------------------|------------------------------------------|
| `SysSum.ps1`          | Full system summary (includes hostname, MAC, BIOS serial, username, etc.) |
| `SysSum-Redac.ps1`    | Redacted summary for public use (sensitive data removed) |
| `README.md`           | Script details and instructions |

Both scripts generate `.txt` reports with:
- OS, CPU, RAM, GPU
- GPU Driver version/date
- Motherboard info
- Disk details
- Timestamp with timezone

---

## 🚀 How to Run the Scripts

> All PowerShell scripts require elevated (admin) execution.

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\ScriptName.ps1
