- create ssh-keys
  - https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent
  - ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  - sudo apt-get install -y xclip
  - cat ~/.ssh/id_rsa.pub | xclip -i -selection clipboard
  - Manually add ssh key to github
  - run setup-git.sh

Solarized Color Scheme comes with gnome-terminal in 16.04
it must be selected as both the color scheme and the palette separately to work as before
.dircolors still required when pallette is switched, other wise it can be removed if standard pallette used.
?? standard palette breaks vim color scheme ??

TODO:
Firefox Developer Edition Link to tar.bz2 file
https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=linux64&lang=en-US


#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Download latest from this web page, then run script
# https://golang.org/dl/
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf ~/Downloads/go*.linux-amd64.tar.gz
