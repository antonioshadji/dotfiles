#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# update linux
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

vim +PluginUpdate +qall

sudo -H pip install --upgrade -r ~/dotfiles/requirements.txt

# update pandoc
cabal update
cabal install cabal-install
cabal install --force-reinstall pandoc
cabal list --installed Pandoc

# update perl
# to use cpanm: curl -L http://cpanmin.us | sudo perl - App::cpanminus
sudo cpanm App::Ack
sudo cpanm Finance::Quote
# https://stackoverflow.com/questions/3727795/how-do-i-update-all-my-cpan-module-to-their-latest-versions
# sudo cpan-outdated -p | sudo cpanm

# update node
npm update -g