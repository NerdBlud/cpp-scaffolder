#!/usr/bin/env bash
set -e

if [[ ! -f build/cpp-scaffolder ]]; then
    echo "❌ Binary not found. Did you build it?"
    exit 1
fi

echo "✅ Binary exists. Running test..."
build/cpp-scaffolder --help
