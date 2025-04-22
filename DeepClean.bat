@echo off
setlocal EnableDelayedExpansion

:: Set log file path
set "LOGFILE=%UserProfile%\Desktop\Cleanup_Log.txt"
echo *** Deep Clean Log - %date% %time% *** > "%LOGFILE%"
echo Starting Deep Clean Process... >> "%LOGFILE%"
echo Starting Deep Clean Process...

:: Kill common locking processes (excluding explorer and brave)
echo Killing common apps to release file locks...
echo [INFO] Attempting to kill common file-locking apps... >> "%LOGFILE%"
for %%P in (
    winword.exe excel.exe chrome.exe firefox.exe msedge.exe teams.exe discord.exe notepad.exe
) do (
    echo [INFO] Checking for process: %%P >> "%LOGFILE%"
    taskkill /f /im %%P >> "%LOGFILE%" 2>&1
)

:: Initialize counters
set /a DeletedFiles=0
set /a DeletedFolders=0

:: Timestamp helper
for /f "tokens=1-2 delims=." %%a in ("%time%") do set "TS=%date% %%a:%%b"

:: Clean %temp%
echo [%TS%] Cleaning %%temp%% folder... >> "%LOGFILE%"
echo Cleaning %%temp%% folder...
for /f %%f in ('dir /a:-d /b "%temp%" 2^>nul') do (
    del /f /q "%temp%\%%f" >> "%LOGFILE%" 2>&1
    if not errorlevel 1 set /a DeletedFiles+=1
)
for /d %%d in ("%temp%\*") do (
    rd /s /q "%%d" >> "%LOGFILE%" 2>&1
    if not errorlevel 1 set /a DeletedFolders+=1
)

:: Clean C:\Windows\Temp
for /f "tokens=1-2 delims=." %%a in ("%time%") do set "TS=%date% %%a:%%b"
echo [%TS%] Cleaning C:\Windows\Temp... >> "%LOGFILE%"
for /f %%f in ('dir /a:-d /b "C:\Windows\Temp" 2^>nul') do (
    del /f /q "C:\Windows\Temp\%%f" >> "%LOGFILE%" 2>&1
    if not errorlevel 1 set /a DeletedFiles+=1
)
for /d %%d in ("C:\Windows\Temp\*") do (
    rd /s /q "%%d" >> "%LOGFILE%" 2>&1
    if not errorlevel 1 set /a DeletedFolders+=1
)

:: Take control of Prefetch and force clean it
for /f "tokens=1-2 delims=." %%a in ("%time%") do set "TS=%date% %%a:%%b"
echo [%TS%] Taking ownership of Prefetch for full cleanup... >> "%LOGFILE%"
takeown /F "C:\Windows\Prefetch" /R /D Y >> "%LOGFILE%" 2>&1
icacls "C:\Windows\Prefetch" /grant administrators:F /T >> "%LOGFILE%" 2>&1
attrib -r -s -h "C:\Windows\Prefetch\*.*" /S /D >> "%LOGFILE%" 2>&1

:: Clean Prefetch
echo [%TS%] Cleaning Prefetch... >> "%LOGFILE%"
del /f /s /q "C:\Windows\Prefetch\*.*" >> "%LOGFILE%" 2>&1

:: Clean SoftwareDistribution\Download
echo [%TS%] Cleaning SoftwareDistribution\Download... >> "%LOGFILE%"
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*.*" >> "%LOGFILE%" 2>&1

:: Delete Windows.old
if exist "C:\Windows.old" (
    echo [%TS%] Deleting Windows.old... >> "%LOGFILE%"
    takeown /F "C:\Windows.old" /R /D Y >>"%LOGFILE%" 2>&1
    icacls "C:\Windows.old" /grant administrators:F /T >>"%LOGFILE%" 2>&1
    rmdir /s /q "C:\Windows.old" >>"%LOGFILE%" 2>&1
) else (
    echo [%TS%] No Windows.old folder found. >> "%LOGFILE%"
)

:: Launch Disk Cleanup
echo Launching Disk Cleanup...
powershell -Command "Start-Process cleanmgr.exe -Verb runAs -Wait"
echo [%date% %time%] Disk Cleanup closed. >> "%LOGFILE%"

:: Clear File Explorer history
for /f "tokens=1-2 delims=." %%a in ("%time%") do set "TS=%date% %%a:%%b"
echo [%TS%] Clearing File Explorer history... >> "%LOGFILE%"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >> "%LOGFILE%" 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >> "%LOGFILE%" 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f >> "%LOGFILE%" 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f >> "%LOGFILE%" 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >> "%LOGFILE%" 2>&1

:: Clear Recent Items (Home Favorites / Recents)
echo [%TS%] Clearing Recent Items (Favorites/Recents in Home)... >> "%LOGFILE%"
del /f /q "%AppData%\Microsoft\Windows\Recent\*" >> "%LOGFILE%" 2>&1
del /f /q "%AppData%\Microsoft\Windows\Recent\AutomaticDestinations\*" >> "%LOGFILE%" 2>&1
del /f /q "%AppData%\Microsoft\Windows\Recent\CustomDestinations\*" >> "%LOGFILE%" 2>&1

:: Run SFC
echo [%TS%] Running SFC /scannow... >> "%LOGFILE%"
sfc /scannow >> "%LOGFILE%" 2>&1
echo SFC scan complete. >> "%LOGFILE%"

:: Summary
echo. >> "%LOGFILE%"
echo ----------- SUMMARY ----------- >> "%LOGFILE%"
echo Deleted Files: %DeletedFiles% >> "%LOGFILE%"
echo Deleted Folders: %DeletedFolders% >> "%LOGFILE%"
echo Cleanup complete at %date% %time% >> "%LOGFILE%"

:: Prompt to restart
choice /M "Would you like to restart the PC now?"
if errorlevel 2 (
    echo Restart declined. >> "%LOGFILE%"
    start notepad "%LOGFILE%"
    exit /b
) else (
    echo Restarting in 10 seconds... >> "%LOGFILE%"
    timeout /t 10
    shutdown /r /t 0
)
