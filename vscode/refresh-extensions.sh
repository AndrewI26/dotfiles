#!/usr/bin/env bash
# Refresh extensions.txt from what's currently installed.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
code --list-extensions > extensions.txt
echo "Wrote $(wc -l < extensions.txt | tr -d ' ') extensions to extensions.txt"
