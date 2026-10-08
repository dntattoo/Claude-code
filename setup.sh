#!/bin/bash

set -e

FREELLMAPI_DIR="/workspaces/freellmapi"

# Already running — do nothing
if curl -sf http://localhost:3001 >/dev/null 2>&1; then
    exit 0
fi

# Clone FreeLLMAPI if it isn't present
if [ ! -d "$FREELLMAPI_DIR/.git" ]; then
    rm -rf "$FREELLMAPI_DIR"
    git clone https://github.com/tashfeenahmed/freellmapi.git "$FREELLMAPI_DIR"
fi

cd "$FREELLMAPI_DIR"

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    npm install
fi

# Start FreeLLMAPI in background
nohup npm run dev > /tmp/freellmapi.log 2>&1 </dev/null &
