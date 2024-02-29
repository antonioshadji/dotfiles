#!/usr/bin/env bash
nvim --version
curl --location --remote-name https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar --extract --gzip --file=nvim-linux64.tar.gz   # -xzf
sudo rsync --archive ./nvim-linux64/ /usr/
rm -rf ./nvim-linux64/ nvim-linux64.tar.gz
nvim --version
# sudo rsync --archive ./nvim-linux64/ debian:/usr/
# sudo rsync --archive ./nvim-linux64/ ubuntu12:/usr/
# rm -rf ./nvim-linux64
# rm -f ./nvim-linux64.tar.gz
