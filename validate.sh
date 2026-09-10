#!/usr/bin/env bash
set -euo pipefail

required_files=("app.sh" "test.sh" "validate.sh" "Jenkinsfile")

for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "Validation failed: missing $file"
        exit 1
    fi
done

if [[ ! -x "app.sh" || ! -x "test.sh" || ! -x "validate.sh" ]]; then
    echo "Validation failed: required scripts are not executable"
    exit 1
fi

echo "Validation passed"
