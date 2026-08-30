#!/usr/bin/env bash
set -euo pipefail

previous="$(aws --version 2>&1 || echo 'none')"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "${TMP_DIR}/awscliv2.zip"
unzip -q -o "${TMP_DIR}/awscliv2.zip" -d "$TMP_DIR"
sudo "${TMP_DIR}/aws/install" --update

echo "Previous version was:"
echo "$previous"
echo "Current version is:"
aws --version
