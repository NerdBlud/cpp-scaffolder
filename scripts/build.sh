set -e

mkdir -p build
cd build

cmake -S .. -B . -DCMAKE_BUILD_TYPE=Release

cmake --build . --parallel

echo "Build complete! Binary located at build/cpp-scaffolder"
