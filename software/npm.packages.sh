#!/usr/bin/env bash

# NOTE: yarn is part of corepack installed by default in latest nodejs
npm -g list --depth 0
npm install -g npm@latest

package_list=(
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
 playwright@latest
 @google/gemini-cli
 opencode-ai
 wrangler  # cloudflare
)

for pkg in "${package_list[@]}"; do
  echo "Installing: ${pkg}"
  npm install -g "${pkg}"
  echo "===="
done

npm -g list --depth 0
# /Users/ahadjigeorgalis/.config/dotfiles/config/nvm/versions/node/v24.12.0/lib
# ├── @fsouza/prettierd@0.27.0
# ├── @google/gemini-cli@0.35.3
# ├── @opencode-ai/plugin@1.2.23
# ├── bash-language-server@5.6.0
# ├── eslint-config-prettier@10.1.8
# ├── eslint@10.1.0
# ├── neovim@5.4.0
# ├── npm@11.12.1
# ├── opencode-ai@1.3.7
# ├── pdfkit@0.18.0
# ├── playwright@1.58.2
# ├── prettier@3.8.1
# ├── puppeteer@24.34.0
# ├── pyright@1.1.408
# ├── typescript-language-server@5.1.3
# ├── typescript@6.0.2
# └── wrangler@4.78.0
#
