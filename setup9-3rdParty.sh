#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# create log file for errors
exec 2> >(tee -a setup$(date '+%Y%m%d-%H%M%S').log >&2)

# set variable to determin os
OS=$(uname -s)

# Linux Only
if [ $OS == "Linux" ]; then
  if ! command -v google-chrome; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
    sudo apt-get install --assume-yes --fix-broken
    rm -f google-chrome*.deb
  fi
  # TODO: this fails wget fails to download correctly ??
  # if ! command -v $HOME/bin/firefox/firefox; then
  #   mkdir -p $HOME/bin
  #   wget -O firefox.tar.bz2 https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=linux64&lang=en-US
  #   tar -vxf firefox.tar.bz2 -C $HOME/bin
  #   rm -f firefox.tar.bz2
  # fi

fi
