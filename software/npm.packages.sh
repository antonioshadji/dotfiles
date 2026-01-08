#!/usr/bin/env bash

# NOTE: yarn is part of corepack installed by default in latest nodejs
package_list=(
 npm
 eslint
 prettier
 @fsouza/prettierd
 eslint-config-prettier
 typescript

# neovim
 neovim
 typescript-language-server
 pyright
 bash-language-server

# tools
 pdfkit
 puppeteer
 @google/gemini-cli
 # @anthropic-ai/claude-code  install only once, then install native build
 wrangler  # cloudflare
)

for pkg in "${package_list[@]}"; do
  echo "Installing: ${pkg}"
  npm install -g "${pkg}"
  echo "===="
done

npm -g list --depth 0
