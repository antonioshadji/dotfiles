#!/usr/bin/env bash
# base install
npm install -g npm
npm install -g eslint
npm install -g prettier
npm install -g prettier-eslint
npm install -g eslint-config-prettier
npm install -g typescript
# vim/neovim
npm install -g neovim
npm install -g vim-language-server
# primetrust
npm install -g @stoplight/spectral-cli

npm -g list --depth 0

# yarn installed separately after node 18.6
# https://yarnpkg.com/getting-started/install
# npm install -g yarn

# 2022-12-31 10:16:24 installed in previous version globally
# /home/antonios/.config/dotfiles/nvm/versions/node/v16.15.0/lib
# ├── @iboss/terrain@0.0.8
# ├── @openapitools/openapi-generator-cli@2.5.2
# ├── @redocly/openapi-cli@1.0.0-beta.65
# ├── @stoplight/spectral@5.9.2
# ├── corepack@0.10.0
# ├── eslint-config-prettier@8.3.0
# ├── eslint@7.32.0
# ├── express-generator@4.16.1
# ├── neovim@4.10.1
# ├── npm@9.2.0
# ├── prettier-eslint@13.0.0
# ├── prettier@2.3.2
# ├── redoc-cli@0.13.0
# ├── typescript@4.4.2
# ├── vim-language-server@2.2.5
# └── yarn@1.22.19
