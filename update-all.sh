#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# create log file for errors
exec 2> >(tee -a update.log >&2)

# Linux Only
if [ "$(uname -s)" != 'Linux' ]; then
  echo 'this update only for linux machines'
  exit
fi

# update linux
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

vim +PluginUpdate +qall

# only install extra software in python 3
sudo -H pip3 install --upgrade -r ~/dotfiles/requirements3.txt

if command -v cabal; then
# update pandoc
cabal update
cabal install --force-reinstall cabal cabal-install
cabal install --force-reinstall pandoc
# cabal list --installed Pandoc
fi

if command -v npm; then
# update node
sudo npm update -g
fi
