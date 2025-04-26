#!/usr/bin/env bash
filename=nvim-linux-x86_64
nvim --version
curl --location --remote-name "https://github.com/neovim/neovim/releases/latest/download/${filename}.tar.gz"
tar --extract --gzip --file="${filename}.tar.gz"   # -xzf
# to prevent changes
sudo rm -rf /usr/share/nvim/runtime
sudo rsync --archive "./${filename}/" /usr/
sleep 1
rm -rf "${filename}*"
nvim --version
# sudo rsync --archive ./nvim-linux64/ debian:/usr/
# sudo rsync --archive ./nvim-linux64/ ubuntu12:/usr/
# rm -rf ./nvim-linux64
# rm -f ./nvim-linux64.tar.gz
