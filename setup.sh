#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Bash Configuration
ln -sf $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc

# Vim Configuration
# TODO: change this to a user prompt
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
  if [ ! -f $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so ]; then
    sudo apt-get install -y build-essential cmake python-dev
    # http://stackoverflow.com/questions/786376/how-do-i-run-a-program-with-a-different-working-directory-from-current-from-lin
    (cd $HOME/.vim/bundle/YouCompleteMe/ && ./install.py)
  fi
fi


# Curl Configuration
ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc

# Tmux Configuration
ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Font Configuration for Airline or Powerline
$HOME/dotfiles/fonts/install.sh

# Linux Only
if [ "$(uname -s)" == 'Linux' ]; then
  # Terminal Colors Configuration
  ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors
  # install useful programs 
  sudo apt-get install -y tree
  sudo apt-get install -y git
  sudo apt-get install -y vim
  sudo apt-get install -y vim-gnome
fi
fi

# Mac OSX Only
if [ "$(uname -s)" == 'Darwin' ]; then
  # Terminal Colors Configuration
  # TODO: Automatically import and delete. Manual go to Preferences > Profiles
  wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
  wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors
  # install homebrew http://brew.sh/
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

