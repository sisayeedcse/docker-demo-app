#!/bin/bash
# Simple healthcheck that looks for JSON status=="OK"
set -euo pipefail

RESP=$(curl -sS http://localhost:5000/health || true)
if echo "$RESP" | grep -q '"status"[[:space:]]*:[[:space:]]*"OK"'; then
    echo "App is healthy"
    exit 0
else
    echo "App is not healthy - response: $RESP"
    exit 1
fi
