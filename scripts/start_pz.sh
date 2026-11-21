#!/usr/bin/env bash
set -euo pipefail

WORKSHOP_DIR="/home/zomboid/server/steamapps/workshop/content/108600"

if [ -d "$WORKSHOP_DIR" ]; then
    find "$WORKSHOP_DIR" -depth -mindepth 2 | while IFS= read -r path; do
        dir=$(dirname "$path")
        base=$(basename "$path")
        lower=$(echo "$base" | tr '[:upper:]' '[:lower:]')
        if [ "$base" != "$lower" ] && [ ! -e "$dir/$lower" ]; then
            ln -s "$base" "$dir/$lower"
        fi
    done
fi

cd /home/zomboid/server
exec ./start-server.sh
