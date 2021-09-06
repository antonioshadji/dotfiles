#!/usr/bin/env bash
# base install
npm install -g npm
npm install -g eslint
npm install -g prettier
npm install -g prettier-eslint
npm install -g eslint-config-prettier
npm install -g typescript
npm install -g yarn
# vim/neovim
npm install -g neovim
npm install -g vim-language-server
# primetrust
npm install -g @stoplight/spectral

npm -g list --depth 0
