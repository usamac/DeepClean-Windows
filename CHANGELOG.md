# 📜 Changelog

All notable changes to **USAMAC ScriptVault** will be documented here.

This project follows a manual versioning approach using tags and clear commit messages.

---

## [v1.0.0] – Initial Public Release
**Date:** 2025-05-02

🎉 First structured release of ScriptVault. Includes:

### 🧹 DeepClean
- Windows cleanup `.bat` script for deleting temp/cache/log files
- Optional safe reboot with prompt
- Generates cleanup logs on the desktop

### 🔎 SysSummary
- `SysSum.ps1`: Full system summary including hostname, BIOS serials, and MACs
- `SysSum-Redac.ps1`: Redacted version safe for public sharing
- Both include GPU driver version, timestamp, and local timezone
- Output saved to Desktop and auto-opens in Notepad

### 📘 Documentation
- README with Shields.io badges, usage instructions, and tool breakdown
- Project banner image added to enhance visual identity
- LICENSE (MIT), CONTRIBUTING, CODE_OF_CONDUCT, and SECURITY policies added

---

## Upcoming
- UWP cleanup tool
- Windows.old detection logic
- Interactive tool launcher (`ScriptMenu.bat`)
- Additional sysadmin tools
