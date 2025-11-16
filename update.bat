@echo off
echo [*] Updating Windows Terminal Setup...
echo.

:: Check if in correct directory
if not exist "profiles\settings.json" (
    echo [!] Please run this from Windows-Terminal-Setup folder!
    pause
    exit /b 1
)

:: Update from git
git pull origin main

if %ERRORLEVEL% NEQ 0 (
    echo [!] Git pull failed!
    echo [?] Check internet connection or run manually.
    pause
    exit /b 1
)

:: Reinstall
call install.bat