set -e

mkdir -p release

OS=$(uname)
BINARY_NAME="cpp-scaffolder"

if [[ "$OS" == "Linux" ]]; then
    cp build/$BINARY_NAME release/
    tar -czf cpp-scaffolder-linux.tar.gz -C release $BINARY_NAME
elif [[ "$OS" == "Darwin" ]]; then
    cp build/$BINARY_NAME release/
    tar -czf cpp-scaffolder-macos.tar.gz -C release $BINARY_NAME
else
    echo "Use package.bat on Windows"
fi

echo "Packaging complete! Check the .tar.gz file in the current directory."
