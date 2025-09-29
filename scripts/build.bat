@echo off

if not exist build mkdir build
cd build

cmake -S .. -B . -DCMAKE_BUILD_TYPE=Release -G "Visual Studio 17 2022" 

cmake --build . --config Release

echo Build complete! Binary located at build\Release\cpp-scaffolder.exe
pause
