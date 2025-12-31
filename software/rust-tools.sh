#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# requires build tools to be installed first
OS=$(uname -s)
if [[ "$OS" = "Linux" ]]; then
  sudo apt install -y curl gcc make cmake g++
fi
if [[ ! -d ~/.cargo ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# shellcheck source=/dev/null
source ~/.cargo/env
rustup update

# Alacritty only needed on desktop machines
if [[ "$OS" = "Linux" ]]; then
  sudo apt install -y libfontconfig1-dev libx11-xcb-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev

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
fi

cargo install alacritty
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

cargo install fd-find
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
cargo install ripgrep
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# added 2024-01-26 15:57:30 to format lua files
cargo install stylua
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
# 2024-01-28 12:12:13 for use with neovim tree-sitter functionality
cargo install tree-sitter-cli
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# added 2025-06-28 16:20:19 justfile and starship.rs
cargo install starship
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
cargo install just
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
# 2025-07-19 11:10:07 added
cargo install lsd
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# 2025-12-30 11:31:51 added
# https://github.com/spider-rs/spider/blob/main/spider_cli/README.md
cargo install -F smart spider_cli
ERR=$?; [[ $ERR != 0 ]] && exit $ERR
