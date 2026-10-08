#!/bin/bash

SERVER_DIR="$(dirname "$(find /workspaces -path '*/server/package.json' -not -path '*/node_modules/*' | head -1)")"

if [ -n "$SERVER_DIR" ]; then
    cd "$SERVER_DIR"
    npm run dev > /tmp/freellmapi.log 2>&1 &
fi
