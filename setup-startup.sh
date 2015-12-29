#!/bin/bash
# Simple setup.sh originally for for configuring Ubuntu 12.04 LTS EC2 instance for headless setup.

#setup vim -- this was added when setting up clean machine ubuntu desktop
sudo apt-get install -y vim vim-doc

# Install and configure Git
sudo apt-get install -y git-core
git config --global --add color.ui true

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install
# nvm use v0.10

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

#Install other various utilities
sudo apt-get install -y tree

# Install ack to use in place of grep
sudo curl http://beyondgrep.com/ack-2.12-single-file > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack

# Install python tools and packages
# TODO: pip must first be installed
sudo pip install --upgrade virtualenv
sudo pip install --upgrade virtualenvwrapper

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d.old
fi
if [ -d .vim/ ]; then
    mv .vim .vim.old
fi
git clone git@github.com:AntoniosHadji/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
ln -sb dotfiles/.dircolors .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.vimrc.plugins .
ln -sb dotfiles/.vimrc.bundles .
ln -sf dotfiles/.vim .
ln -sf dotfiles/.fonts .
sudo fc-cache -f
# Vundle must be installed via git before it can managed itself and others
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
# gnome terminal colors
# git@github.com:Anthony25/gnome-terminal-colors-solarized.git
# https://github.com/Anthony25/gnome-terminal-colors-solarized.git
# Fonts
# create dir ~/.config/fontconfig/conf.d/
# install wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# into created directory
# install wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
# into ~/.fonts directory
# run sudo fc-cache -vf ~/.fonts

# enable ssh access - as of 15.10 sudo ufw allow 22 command not necessary
sudo apt-get install -y openssh-server

