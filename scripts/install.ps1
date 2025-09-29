$ErrorActionPreference = "Stop"
$Repo = "nerdblud/cpp-scaffolder"

$ReleaseJson = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/latest"
$Version = $ReleaseJson.tag_name

$ZipName = "cpp-scaffolder-$Version-windows.zip"
$TmpPath = "$env:TEMP\$ZipName"
Invoke-WebRequest -Uri "https://github.com/$Repo/releases/download/$Version/$ZipName" -OutFile $TmpPath

$ExtractPath = "$env:TEMP\cpp-scaffolder"
Expand-Archive -Path $TmpPath -DestinationPath $ExtractPath -Force

$InstallDir = "$env:USERPROFILE\bin"
New-Item -ItemType Directory -Force -Path $InstallDir
Copy-Item -Path "$ExtractPath\cpp-scaffolder.exe" -Destination "$InstallDir\"

if (-not ($env:PATH -split ";" | Where-Object { $_ -eq $InstallDir })) {
    [Environment]::SetEnvironmentVariable("PATH", "$env:PATH;$InstallDir", "User")
}

Write-Host "✅ cpp-scaffolder $Version installed! You may need to restart your terminal."
