#!/bin/bash

SERVER_PACKAGE="$(find . -type f -path '*/server/package.json' -not -path '*/node_modules/*' -print -quit)"

if [ -z "$SERVER_PACKAGE" ]; then
    exit 1
fi

SERVER_DIR="$(dirname "$SERVER_PACKAGE")"

if ! curl -s http://localhost:3001 >/dev/null 2>&1; then
    cd "$SERVER_DIR" || exit 1
    nohup npm run dev > /tmp/freellmapi.log 2>&1 &
fi
