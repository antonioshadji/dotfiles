#!/usr/bin/env bash
# -*- coding: utf-8 -*-
ln -sf $HOME/dotfiles/.vimrc $HOME/.
ln -sf $HOME/dotfiles/.vimrc.plugins $HOME/.
ln -sf $HOME/dotfiles/.vimrc.bundles $HOME/.
if [ -d $HOME/.vim/ ]; then
  NOW=$(date +"%Y-%m%d-%H%M%S")
  mv $HOME/.vim $HOME/.vim-backup$NOW
fi
ln -sf $HOME/dotfiles/.vim/ $HOME/.
vim +PluginInstall +qall
