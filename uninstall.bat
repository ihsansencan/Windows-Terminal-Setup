@echo off
echo [*] Uninstalling Windows Terminal Setup...
echo.

:: Restore original settings if backup exists
if exist "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.backup" (
    copy "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.backup" "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" /Y
    del "%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.backup"
    echo [+] Original Windows Terminal settings restored!
) else (
    echo [!] No backup found. Windows Terminal settings not modified.
)

:: Remove PowerShell Profiles
echo [+] Removing PowerShell Profiles...
del "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" >nul 2>&1
del "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" >nul 2>&1
echo [+] PowerShell profiles removed!

echo.
pause