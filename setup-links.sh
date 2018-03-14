#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Git must be installed prior to running this script

# create log file for errors
exec 2> >(tee -a setup$(date '+%Y%m%d-%H%M%S').log >&2)

# set variable to determin os
OS=$(uname -s)

# Linux Only
if [ $OS == "Linux" ]; then

  # Symbolic Links
  # in home directory
  # TODO:do I need these on mac osx?
  ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc
  ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors
  ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc
  ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

  # Remap caps lock key to ESC
  # https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim
  # this is temporary, not permanent
  # xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

  # end linux only setup
fi

# these symlinks are needed on both mac and linux
# Vim Configuration
# vim by default looks in .vim/ for vimrc
if [[ ! -d $HOME/.vim ]]; then
  ln -sf $HOME/dotfiles/vim $HOME/.vim
  ln -sf $XDG_CONFIG_HOME/nvim $HOME/.vim
  (cd $HOME/.vim && ln -sf init.vim vimrc)
fi


ln -sf $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc


