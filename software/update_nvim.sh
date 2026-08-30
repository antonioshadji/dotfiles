#!/usr/bin/env bash
set -euo pipefail

OS="$(uname -s)"
ARCH="$(uname -m)"

if [[ "$OS" == "Darwin" ]]; then
  echo "==> Running on macOS ($ARCH)"
  if [[ "$ARCH" == "arm64" ]]; then
    filename="nvim-macos-arm64"
  else
    filename="nvim-macos-x86_64"
  fi
elif [[ "$OS" == "Linux" ]]; then
  echo "==> Running on Linux ($ARCH)"
  if [[ "$ARCH" == "x86_64" ]]; then
    filename="nvim-linux-x86_64"
  elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
    filename="nvim-linux-arm64"
  else
    filename="nvim-linux-${ARCH}"
  fi
else
  echo "Error: Unknown Operating System: $OS" >&2
  exit 1
fi

echo "==> Current Neovim version:"
nvim --version 2>/dev/null | head -n 2 || echo "Neovim not found"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "==> Downloading latest Neovim (${filename})..."
curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/${filename}.tar.gz" -o "${TMP_DIR}/${filename}.tar.gz"

echo "==> Extracting Neovim..."
tar -xzf "${TMP_DIR}/${filename}.tar.gz" -C "$TMP_DIR"

echo "==> Installing to /opt/${filename}..."
sudo rm -rf "/opt/${filename}"
sudo mv "${TMP_DIR}/${filename}" /opt/
sudo ln -sf "/opt/${filename}/bin/nvim" /usr/local/bin/nvim

# rehash bash to update nvim reference cached
hash -r 2>/dev/null || true

echo "==> Updated Neovim version:"
nvim --version | head -n 2
