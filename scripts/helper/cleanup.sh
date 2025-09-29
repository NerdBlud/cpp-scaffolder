#!/usr/bin/env bash
set -e

echo "Cleaning temporary files..."
rm -rf /tmp/cpp-scaffolder*
echo "✅ Done."

echo "Cleaning build files..."
rm -rf build
echo "✅ Done."