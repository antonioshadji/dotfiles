#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# requires build tools to be installed first
sudo apt install -y curl gcc make cmake g++
if [[ ! -d ~/.cargo ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# shellcheck source=/dev/null
source ~/.cargo/env
rustup update

cargo install fd-find
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
cargo install ripgrep
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# only needed on desktop machines
sudo apt install -y libfontconfig1-dev libx11-xcb-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
cargo install alacritty
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# man page
sudo mkdir -p /usr/local/share/man/man1
URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.man
FILE=/usr/local/share/man/man1/alacritty.1.gz
sudo rm "$FILE"
curl "$URL" | gzip -c | sudo tee "$FILE" > /dev/null

# desktop file
URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/alacritty-term.svg
FILE=/usr/share/pixmaps/Alacritty.svg
if [[ ! -f $FILE ]]; then
  sudo curl "$URL" --output "$FILE"

  URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/linux/Alacritty.desktop
  curl -O "$URL"
  sudo desktop-file-install --delete-original ./Alacritty.desktop
  # rm -f Alacritty.desktop
  sudo update-desktop-database
fi

# added 2024-01-26 15:57:30 to format lua files
cargo install stylua
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
# 2024-01-28 12:12:13 for use with neovim tree-sitter functionality
cargo install tree-sitter-cli
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
