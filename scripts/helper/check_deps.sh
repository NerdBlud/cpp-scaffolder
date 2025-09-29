#!/usr/bin/env bash
set -e

for cmd in cmake g++ git; do
    if ! command -v $cmd &> /dev/null; then
        echo "❌ $cmd is not installed."
        exit 1
    fi
done

echo "✅ All dependencies found."
exit 0
