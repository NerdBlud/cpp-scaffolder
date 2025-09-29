#!/usr/bin/env bash
set -e

REPO="nerdblud/cpp-scaffolder"
TMP_DIR=$(mktemp -d)
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
OS=${OS/darwin/macos}

VERSION=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')

ARCHIVE="cpp-scaffolder-${VERSION}-${OS}.tar.gz"
curl -L -o "$TMP_DIR/$ARCHIVE" "https://github.com/$REPO/releases/download/$VERSION/$ARCHIVE"

tar -xzf "$TMP_DIR/$ARCHIVE" -C "$TMP_DIR"

sudo mv "$TMP_DIR/cpp-scaffolder" /usr/local/bin/
sudo chmod +x /usr/local/bin/cpp-scaffolder

echo "✅ cpp-scaffolder $VERSION installed! Run 'cpp-scaffolder' to start."
