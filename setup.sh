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


