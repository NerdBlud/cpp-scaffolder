if (-not (Get-Command cpp-scaffolder -ErrorAction SilentlyContinue)) {
    Write-Host "⚠️ cpp-scaffolder is not installed. Run install.ps1 first."
    exit 1
}

Write-Host "Updating cpp-scaffolder..."
& "$PSScriptRoot\install.ps1"

Write-Host "✅ cpp-scaffolder updated!"