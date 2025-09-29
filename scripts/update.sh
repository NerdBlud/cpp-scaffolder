#!/usr/bin/env bash
set -e

if ! command -v cpp-scaffolder &> /dev/null; then
    echo "⚠️ cpp-scaffolder is not installed. Run install.sh first."
    exit 1
fi

echo "Updating cpp-scaffolder..."
bash "$(dirname "$0")/install.sh"

echo "✅ cpp-scaffolder updated!"