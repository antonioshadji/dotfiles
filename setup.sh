#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Bash Configuration
ln -sf $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc

# Vim Configuration
if [ -d $HOME/.vim/ ]; then
  NOW=$(date +"%Y-%m%d-%H%M%S")
  mv $HOME/.vim $HOME/vim-backup$NOW
fi
ln -sf $HOME/dotfiles/vim/ $HOME/.vim
ln -sf $HOME/dotfiles/vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/vimrc.plugins $HOME/.vimrc.plugins
ln -sf $HOME/dotfiles/vimrc.bundles $HOME/.vimrc.bundles
ln -sf $HOME/dotfiles/vim/ $HOME/.nvim
ln -sf $HOME/dotfiles/vimrc $HOME/.nvimrc
vim +PluginInstall +qall

# Airline Font Configuration
# Linux Only ** TODO: this needs further research, or use powerline
if [ "$(uname -s)" == 'Linux' ]; then
  trgt=$HOME/dotfiles/config/fontconfig/font.conf/10-powerline-symbols.conf
  dest=$HOME/.config/fontconfig/fonts.conf/.
  ln -sf $trgt $dest
fi

# Git Configuration
ln -sf $HOME/dotfiles/gitconfig $HOME/.gitconfig
git config --global user.email "Antonios@$HOSTNAME"
# git config --global user.name "Antonios Hadjigeorgalis"
# simple is new default push method after Git 2.0
# git config --global push.default simple

# Curl Configuration
ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc

# Tmux Configuration
ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Terminal Colors Configuration
ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors
