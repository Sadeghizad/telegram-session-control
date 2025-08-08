@echo off
setlocal

:: ==========================
:: Telegram.bat - Launch Telegram, auto-close after timed session, show warnings, and log session end
:: ==========================

set "logDir=C:\Users\YourUsername\Desktop\AppUsageLogs"
set "logFile=%logDir%\Telegram.log"
set "appName=Telegram.exe"              :: <- Use the actual exe name as seen in Task Manager Details tab
set "processName=Telegram.exe"          :: <- Use the same as above
set "duration=180"                      :: 3 minutes (in seconds)

:: Start Telegram (the real exe must exist in the same directory or provide full path)
start "" "%appName%"

:: Wait 2 minutes, then show warning popup
timeout /t 120 /nobreak >nul
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('2 minutes have passed. Telegram will close soon.', 'Warning')"

:: Wait 30 seconds, then show final warning
timeout /t 30 /nobreak >nul
powershell -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('30 seconds left. Telegram will be closed.', 'Final Warning')"

:: Wait last 30 seconds, then kill Telegram
timeout /t 30 /nobreak >nul
taskkill /f /im %processName% >nul 2>&1

:: Log session end
echo [%date% %time%] [END] Telegram closed after %duration% seconds. >> "%logFile%"
exit
