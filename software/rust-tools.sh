#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# requires build tools to be installed first
sudo apt install -y curl gcc make cmake g++
if [[ ! -d ~/.cargo ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
ERR=$?; [[ ! $ERR ]] && exit $ERR

# shellcheck source=/dev/null
source ~/.cargo/env

cargo install fd-find
ERR=$?; [[ ! $ERR ]] && exit $ERR
cargo install ripgrep
ERR=$?; [[ ! $ERR ]] && exit $ERR

# only needed on desktop machines
sudo apt install -y libfontconfig1-dev libx11-xcb-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
cargo install alacritty
