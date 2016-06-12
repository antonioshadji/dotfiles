#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# create log file for errors
exec 2> >(tee -a setup.log >&2)

# Git must be installed prior to pulling this repo.

# Linux Only
if [ "$(uname -s)" == "Linux" ]; then
  # update linux
  sudo apt-get update
  sudo apt-get upgrade -y
  # install useful programs
  sudo apt-get install -y build-essential cmake python3-dev
  sudo apt-get install -y tree
  sudo apt-get install -y curl
  sudo apt-get install -y vim vim-gnome
  sudo apt-get install -y libblas-dev liblapack-dev gfortran
  sudo apt-get install -y libpng12-dev libfreetype6-dev
  sudo apt-get install -y redshift-gtk
  sudo apt-get install -y silversearcher-ag

  # Symbolic Links
  if [[ ! -d $HOME/.vim ]]; then
    ln -sf $HOME/dotfiles/vim $HOME/.vim
  fi

  ln -sf $HOME/dotfiles/bash_profile $HOME/.profile
  ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc
  ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc
  ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors

  ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc
  ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
  ln -sf $HOME/dotfiles/config/redshift.conf $HOME/.config/.

  # Remap caps lock key to ESC
  # https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim
  # this is temporary, not permanent
  # xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

  # remove any unneeded software
  sudo apt-get autoremove -y
fi


# Vim Configuration
# vim by default looks in .vim/ for vimrc
# TODO: nvim config not neccessary in setup remove /document
# ln -sf $HOME/dotfiles/vim/ $HOME/.config/nvim
# ln -sf $HOME/dotfiles/vim/vimrc $HOME/.config/nvim/init.vim
vim +PluginInstall +qall

if [[ -d $HOME/.vim/bundle/YouCompleteMe/ ]]; then
  if [[ ! -x $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]]; then
    # http://stackoverflow.com/questions/786376/how-do-i-run-a-program-with-a-different-working-directory-from-current-from-lin
    (cd $HOME/.vim/bundle/YouCompleteMe/ && python3 install.py)
  fi
fi


# Font Configuration for Airline or Powerline
$HOME/dotfiles/fonts/install.sh

# Ruby
if ! command -v ruby; then
  sudo apt-get install -y ruby ruby-dev
fi
if ! command -v jekyll; then
  sudo gem install jekyll
fi

# Node
# TODO: can this command be called multiple times? How to verify if needed?
# http://askubuntu.com/questions/182674/how-to-verify-if-a-repository-is-already-added
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# sudo apt-get install -y nodejs
if [[ ! -d $HOME/.nvm ]]; then
  git clone git@github.com:creationix/nvm.git $HOME/.nvm
else
  (cd $HOME/.nvm && git checkout $(git describe --tags --abbrev=0))
fi
if [[ -r $HOME/.nvm/nvm.sh ]]; then
  NVM_DIR=$HOME/.nvm
  source $HOME/.nvm/nvm.sh
fi

if ! command -v nvm; then
  nvm install v6
else
  nvm use v6
fi

if ! command -v tern; then
  npm install -g tern
fi

if command -v npm; then
  # update node
  npm update -g
fi

# Python3: only install extra software in python 3
if ! command -v pip3; then
  curl -sL https://bootstrap.pypa.io/get-pip.py | sudo -HE python3 -
else
  sudo -H pip3 install --upgrade -r ~/dotfiles/requirements3.txt
fi

# Mac OSX Only
if [ "$(uname -s)" == 'Darwin' ]; then
  # Vim 7.3 on Mac OSX does not have same default settings files as 7.4
  ln -sf $HOME/dotfiles/vim/vimrc $HOME/.vimrc
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

