#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Linux Only
if [ "$(uname -s)" == 'Linux' ]; then
  # install useful programs
  sudo apt-get install -y build-essential cmake python-dev
  sudo apt-get install -y tree
  sudo apt-get install -y git
  sudo apt-get install -y vim
  sudo apt-get install -y vim-gnome

  # Terminal Colors Configuration
  ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors
fi

# Mac OSX Only
if [ "$(uname -s)" == 'Darwin' ]; then
  # install homebrew http://brew.sh/
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # https://danielmiessler.com/blog/first-10-things-new-mac/#software
  # brew install findutils --default-names
  # brew install gnu-sed --default-names
  # brew install gnu-tar --default-names
  # brew install gnu-which --default-names
  # brew install gnutls --default-names
  # brew install grep --default-names
  # brew install coreutils
  # brew install binutils
  # brew install diffutils
  # brew install gzip
  # brew install watch
  # brew install tmux
  # brew install wget
  # brew install nmap
  # brew install gpg
  # brew install htop
  # Terminal Colors Configuration
  # TODO: Automatically import and delete. Manual go to Preferences > Profiles
  # https://www.iterm2.com/index.html
  # curl --remote-name https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
  # curl --remote-name https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors
fi

# Bash Configuration
ln -sf $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc

# Vim Configuration
# TODO: is this necessary? I think not
#if [ -d $HOME/.vim/ ]; then
#  NOW=$(date +"%Y-%m%d-%H%M%S")
#  cp -R $HOME/.vim $HOME/backup-vim.$NOW
#fi
# TODO: this line creates link in dotfiles/vim on Mac OSX
ln -sf $HOME/dotfiles/vim $HOME/.vim

# vim by default looks in .vim/ for vimrc
#ln -sf $HOME/dotfiles/vimrc $HOME/.vimrc
#ln -sf $HOME/dotfiles/vimrc.plugins $HOME/.vimrc.plugins
#ln -sf $HOME/dotfiles/vimrc.bundles $HOME/.vimrc.bundles
# TODO: nvim config not neccessary in setup remove /document
# ln -sf $HOME/dotfiles/vim/ $HOME/.config/nvim
# ln -sf $HOME/dotfiles/vim/vimrc $HOME/.config/nvim/init.vim
vim +PluginInstall +qall
# this does not work on mac TODO: Is this necessary in setup?
#if [ -d $HOME/.vim/bundle/YouCompleteMe/ ]; then
#  if [ ! -f $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so ]; then
#    # http://stackoverflow.com/questions/786376/how-do-i-run-a-program-with-a-different-working-directory-from-current-from-lin
#    (cd $HOME/.vim/bundle/YouCompleteMe/ && ./install.py)
#  fi
#fi

# Curl Configuration
ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc

# Tmux Configuration
ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

# Font Configuration for Airline or Powerline
$HOME/dotfiles/fonts/install.sh

# Git Configuration
git config --global user.email "Antonios@Hadji.co"
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
# http://haacked.com/archive/2014/07/28/github-flow-aliases/
# TODO: create aliases for
# git clone --recursive (always want to recurse submodules)
# git pull --recurse-submodules (always want latest submodule)
