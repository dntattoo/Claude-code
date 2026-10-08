#!/bin/bash

cd "/workspaces/Cloud Code/FreeLLMAPI/server"

if ! curl -s http://localhost:3001 >/dev/null 2>&1; then
    nohup npm run dev > /tmp/freellmapi.log 2>&1 &
fi
