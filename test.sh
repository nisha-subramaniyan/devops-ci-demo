#!/usr/bin/env bash
set -euo pipefail

output=$(./app.sh)

if [[ "$output" == "Application is running successfully" ]]; then
    echo "Test passed"
else
    echo "Test failed"
    exit 1
fi
