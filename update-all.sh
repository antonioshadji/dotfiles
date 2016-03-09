#!/usr/bin/env bash
# -*- coding: utf-8 -*-

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

sudo -H pip install --upgrade -r ~/dotfiles/requirements.txt
sudo -H pip3 install --upgrade -r ~/dotfiles/requirements3.txt

if command -v cabal; then
# update pandoc
cabal update
cabal install cabal-install
cabal install --force-reinstall pandoc
cabal list --installed Pandoc
fi

# if command -v cpanm; then
# update perl
# to use cpanm: curl -L http://cpanmin.us | sudo perl - App::cpanminus
# sudo cpanm App::Ack
# sudo cpanm Finance::Quote
# https://stackoverflow.com/questions/3727795/how-do-i-update-all-my-cpan-module-to-their-latest-versions
# sudo cpan-outdated -p | sudo cpanm

if command -v npm; then
# update node
sudo npm update -g
fi
