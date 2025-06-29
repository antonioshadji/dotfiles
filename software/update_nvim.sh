#!/usr/bin/env bash
filename=nvim-linux-x86_64
nvim --version
curl --location --remote-name "https://github.com/neovim/neovim/releases/latest/download/${filename}.tar.gz"
tar --extract --gzip --file="${filename}.tar.gz"   # -xzf
# 2025-06-28 --delete on rsync deleted whole /usr directory 
# sudo rm -rf /usr/share/nvim/runtime
# sudo rsync --archive "./${filename}/" /usr/local/
# sleep 1
# rm -rf ${filename}*
# nvim --version
# sudo rsync --archive ./nvim-linux64/ debian:/usr/
# sudo rsync --archive ./nvim-linux64/ ubuntu12:/usr/
