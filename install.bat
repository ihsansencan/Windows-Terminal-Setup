@echo off
echo [*] Installing Windows Terminal Setup...
echo.

:: Check if Windows Terminal is installed
if not exist "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\" (
    echo [!] Windows Terminal not found!
    echo [!] Please install Windows Terminal from Microsoft Store.
    pause
    exit /b 1
)

:: Backup existing settings
if exist "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" (
    copy "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.backup"
    echo [+] Existing settings backed up
)

:: Install Windows Terminal Settings
echo [+] Installing Windows Terminal Configuration...
xcopy "profiles\settings.json" "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\" /Y >nul

:: Install PowerShell Profiles
echo [+] Installing PowerShell Profiles...
xcopy "profiles\Ps.ps1" "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" /Y >nul
xcopy "profiles\Ps7.ps1" "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" /Y >nul

if %ERRORLEVEL% EQU 0 (
    echo [+] Installation completed successfully!
    echo [!] Please restart Windows Terminal.
) else (
    echo [!] Installation failed!
)

echo.
pause