#!/usr/bin/env bash
set -euo pipefail

echo "==> Updating uv..."
uv self update

echo "==> Updating uv tools..."
uv tool update --all
