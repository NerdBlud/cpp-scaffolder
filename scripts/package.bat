@echo off

if not exist release mkdir release
copy build\Release\cpp-scaffolder.exe release\

powershell Compress-Archive -Path release\cpp-scaffolder.exe -DestinationPath cpp-scaffolder-windows.zip

echo Packaging complete! ZIP file: cpp-scaffolder-windows.zip
pause
