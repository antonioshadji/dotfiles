#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Bash Configuration
sudo apt-get install -y tree
ln -sf $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc

# Vim Configuration
if [ -d $HOME/.vim/ ]; then
  NOW=$(date +"%Y-%m%d-%H%M%S")
  cp --recursive $HOME/.vim $HOME/backup-vim.$NOW
fi
ln -sf $HOME/dotfiles/vim/ $HOME/.vim
ln -sf $HOME/dotfiles/vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/vimrc.plugins $HOME/.vimrc.plugins
ln -sf $HOME/dotfiles/vimrc.bundles $HOME/.vimrc.bundles
ln -sf $HOME/dotfiles/vim/ $HOME/.config/nvim
ln -sf $HOME/dotfiles/vimrc $HOME/.config/nvim/init.vim
vim +PluginInstall +qall
if [ -d $HOME/.vim/bundle/YouCompleteMe/ ]; then
  sudo apt-get install -y cmake
  # http://stackoverflow.com/questions/786376/how-do-i-run-a-program-with-a-different-working-directory-from-current-from-lin
  (cd $HOME/.vim/bundle/YouCompleteMe/ && ./install.py)
else 
  echo "YouCompleteMe not found"
fi

# Git Configuration
sudo apt-get install -y git-core
git config --global user.email "Antonios@$HOSTNAME"
git config --global user.name "Antonios Hadjigeorgalis"
git config --global color.ui true
# simple is new default push method after Git 2.0
git config --global push.default simple
git config --global credential.helper 'cache --timeout=3600'
git config --global grep.linenumber true
git config --global grep.extendregexp true
git config --global alias.g 'grep --break --heading --line-number'
git config --global push.default simple
git config --global core.autocrlf input
git config --global status.branch true
git config --global status.short true

# Curl Configuration
ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc

# Tmux Configuration
ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Linux Only
if [ "$(uname -s)" == 'Linux' ]; then
  # Airline Font Configuration
  # TODO: this needs further research, or use powerline
  trgt=$HOME/dotfiles/config/fontconfig/font.conf/10-powerline-symbols.conf
  dest=$HOME/.config/fontconfig/fonts.conf/.
  mkdir -p $dest
  ln -sf $trgt $dest

    # Terminal Colors Configuration
  ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors
fi

# Mac OSX Only
if [ "$(uname -s)" == 'Darwin' ]; then
  # TODO: Automatically import and delete. Manual go to Preferences > Profiles
  wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
  wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors
fi


