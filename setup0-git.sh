#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Git Configuration
if ! command -v git; then
  if [ "$(uname -s)" == "Linux" ]; then
     sudo apt-get install -y git
  fi
fi

# create dotfiles directory
if [[ ! -d $HOME/dotfiles ]]; then
  git clone --recursive git@github.com:AntoniosHadji/dotfiles.git $HOME/dotfiles
  (cd $HOME/dotfiles && git pull --recurse-submodules)
fi

ln -sf $HOME/dotfiles/gitconfig $HOME/.gitconfig

# http://haacked.com/archive/2014/07/28/github-flow-aliases/
# TODO: create aliases for
# git clone --recursive (always want to recurse submodules)
# git pull --recurse-submodules (always want latest submodule)
