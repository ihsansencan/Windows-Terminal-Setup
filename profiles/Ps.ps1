# Clear screen but keep PowerShell's original welcome
function Show-CustomHeader {
    # Keep PowerShell's original welcome
    # Just add our custom header below
    Write-Host ""
    Write-Host "=== WINDOWS TERMINAL ===" -ForegroundColor Cyan
    Write-Host "Ready at: $(Get-Date -Format 'yyyy.MM.dd HH:mm:ss')" -ForegroundColor Green
    Write-Host ""
}

# Show custom header when PowerShell starts
Show-CustomHeader