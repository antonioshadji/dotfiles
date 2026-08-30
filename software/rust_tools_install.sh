#!/usr/bin/env bash
# -*- coding: utf-8 -*-
set -euo pipefail
export TMPDIR="${TMPDIR:-/var/tmp}"

# requires build tools to be installed first
OS=$(uname -s)
if [[ "$OS" = "Linux" ]]; then
  sudo apt install -y curl gcc make cmake g++ clang libssl-dev
fi
if [[ ! -d ~/.cargo ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# shellcheck source=/dev/null
source ~/.cargo/env
rustup update

if [[ "$OS" = "Linux" ]]; then
  # Alacritty desktop configuration
  sudo apt install -y libfontconfig1-dev libx11-xcb-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev scdoc

  # man page
  sudo mkdir -p /usr/local/share/man/man1 /usr/local/share/man/man5
  for manpage in alacritty.1 alacritty-msg.1; do
    URL="https://raw.githubusercontent.com/alacritty/alacritty/master/extra/man/${manpage}.scd"
    FILE="/usr/local/share/man/man1/${manpage}.gz"
    sudo rm -f "$FILE"
    curl -fsSL "$URL" | scdoc | gzip -c | sudo tee "$FILE" > /dev/null
  done
  for manpage in alacritty.5 alacritty-bindings.5; do
    URL="https://raw.githubusercontent.com/alacritty/alacritty/master/extra/man/${manpage}.scd"
    FILE="/usr/local/share/man/man5/${manpage}.gz"
    sudo rm -f "$FILE"
    curl -fsSL "$URL" | scdoc | gzip -c | sudo tee "$FILE" > /dev/null
  done

  # desktop file
  URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/alacritty-term.svg
  FILE=/usr/share/pixmaps/Alacritty.svg
  if [[ ! -f $FILE ]]; then
    sudo curl -fsSL "$URL" --output "$FILE"

    URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/linux/Alacritty.desktop
    curl -fsSL -O "$URL"
    sudo desktop-file-install --delete-original ./Alacritty.desktop
    # rm -f Alacritty.desktop
    sudo update-desktop-database
  fi
  # 2026-03-22 18:23:12 Sunday replace GDM
  # not available via this method
  # cargo install tuigreet
  cargo install --locked --git https://github.com/apognu/tuigreet
  # must be in path for greeter to work
  sudo cp ~/.cargo/bin/tuigreet /usr/local/bin/tuigreet
  sudo mkdir -p /var/cache/tuigreet
  sudo chown _greetd:_greetd /var/cache/tuigreet
  sudo chmod 0755 /var/cache/tuigreet
fi

cargo install alacritty --locked
cargo install fd-find --locked
cargo install ripgrep --locked

# added 2024-01-26 15:57:30 to format lua files
cargo install stylua --locked
# 2024-01-28 12:12:13 for use with neovim tree-sitter functionality
cargo install tree-sitter-cli --locked

# added 2025-06-28 16:20:19 justfile and starship.rs
cargo install starship --locked
cargo install just --locked
# 2025-07-19 11:10:07 added
cargo install lsd --locked

# 2025-12-30 11:31:51 added
# https://github.com/spider-rs/spider/blob/main/spider_cli/README.md
cargo install -F smart spider_cli --locked

# 2026-01-01 12:26:35 Thursday added
cargo install taplo-cli --locked

# 2026-01-08 17:44:26 Thursday  added recommended by Anaconda Engineering
cargo install bat --locked

# 2026-03-26 13:15:36 Thursday added to work with asciinema
cargo install --locked --git https://github.com/asciinema/asciinema
cargo install --locked --git https://github.com/asciinema/agg

# 2026-04-04 12:07:35 Saturday cli email client
cargo install --locked himalaya

# 2026-03-21 13:30:58 Saturday
cargo install --locked --git https://github.com/googleworkspace/cli

# 2026-04-13 14:31:24 Monday
cargo install du-dust --locked
