#!/bin/bash

set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: $0 <number>" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/seminar_$1"

mkdir -p "$TARGET_DIR/data"
echo "Created folder: seminar_$1"

cp "$SCRIPT_DIR/generic.ipynb" "$TARGET_DIR/seminar_$1.ipynb"
echo "Copied generic.ipynb to $TARGET_DIR/seminar_$1.ipynb"