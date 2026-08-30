#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "==> Updating Python packages in user environment..."
python3 -m pip install --user --upgrade -r requirements-py3-global.txt

echo "==> Updating uv..."
uv self update

echo "==> Updating uv tools..."
uv tool update --all
