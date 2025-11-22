@echo off
:: Check for Admin Privileges and Elevate if necessary
FSUTIL DIRTY query %SystemDrive% >NUL || ( PowerShell "Start-Process -FilePath '%~f0' -Verb RunAs" & EXIT )

:: --- Your elevated commands start here ---
ECHO Script is running with administrator privileges.
PAUSE
REM Add your administrative commands below this line (e.g., net start MyService, ipconfig /flushdns)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Set-ExecutionPolicy Bypass -Scope Process -Force; ^
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; ^
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
refreshenv
choco install zerotier-one -y
refreshenv
zerotier-cli join 83048a0632d1b83b
pause