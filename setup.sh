#!/bin/bash

SERVER_DIR="$(dirname "$(find /workspaces -path '*/server/package.json' -not -path '*/node_modules/*' | head -1)")"

if [ -n "$SERVER_DIR" ]; then
    cd "$SERVER_DIR"
    if ! curl -s http://localhost:3001 >/dev/null 2>&1; then
        nohup npm run dev > /tmp/freellmapi.log 2>&1 &
    fi
fi
