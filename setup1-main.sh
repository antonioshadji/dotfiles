#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Git must be installed prior to running this script

# create log file for errors
exec 2> >(tee -a setup$(date '+%Y%m%d-%H%M%S').log >&2)

# set variable to determin os
OS=$(uname -s)

# Linux Only
if [ $OS == "Linux" ]; then
  # update linux only
  sudo apt-get update
  sudo apt-get upgrade -y
  # install useful programs
  sudo apt-get install -y build-essential cmake python3-dev openjdk-8-jdk
  sudo apt-get install -y libblas-dev liblapack-dev gfortran
  sudo apt-get install -y libpng12-dev libfreetype6-dev
  sudo apt-get install -y tree curl silversearcher-ag
  sudo apt-get install -y vim vim-gnome
  sudo apt-get install -y redshift-gtk vlc
  # for Pandoc
  sudo apt-get install -y texlive
  sudo apt-get install -y stack
  # for Dropbox -- Dropbox has been installed manually (requires web scrape to automate)
  sudo apt-get install python-gpgme
  # for Android Studio (32 bit libraries) lib32bz2-1.0 not found on 16.04
  sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6

  # Symbolic Links
  # in home directory
  # TODO:do I need these on mac osx?
  ln -sf $HOME/dotfiles/inputrc $HOME/.inputrc
  ln -sf $HOME/dotfiles/dircolors $HOME/.dircolors
  ln -sf $HOME/dotfiles/curlrc $HOME/.curlrc
  ln -sf $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
  ln -sf $HOME/dotfiles/octaverc $HOME/.octaverc
  ln -sf $HOME/dotfiles/tern-config $HOME/.tern-config
  # .config directory
  ln -sf $HOME/dotfiles/config/redshift.conf $HOME/.config/.
  # /etc directory
  sudo ln -sf $HOME/dotfiles/etc/apt/apt.conf.d/50unattended-upgrades \
    /etc/apt/apt.conf.d/.
  sudo ln -sf $HOME/dotfiles/etc/sudoers.d/10-local /etc/sudoers.d/.

  # Remap caps lock key to ESC
  # https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim
  # this is temporary, not permanent
  # xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

  # remove any unneeded software
  sudo apt-get autoremove -y
  # end linux only setup
fi

# these symlinks are needed on both mac and linux
# Vim Configuration
# vim by default looks in .vim/ for vimrc
if [[ ! -d $HOME/.vim ]]; then
  ln -sf $HOME/dotfiles/vim $HOME/.vim
fi
if command -v vim; then
  vim +PluginInstall +qall
fi

if [[ -d $HOME/.vim/bundle/YouCompleteMe/ ]]; then
  if [[ ! -x $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]]; then
    # http://stackoverflow.com/questions/786376/how-do-i-run-a-program-with-a-different-working-directory-from-current-from-lin
    (cd $HOME/.vim/bundle/YouCompleteMe/ && python3 install.py)
  fi
fi

ln -sf $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc


# Ruby.
# TODO: in dotfiles/notes - verify correct rvm paths
# https://github.com/rvm/rvm/blob/master/binscripts/rvm-installer
if ! command -v rvm; then
  # gpg -k returns 0 if key exists
  [[ ! $(gpg -k 409B6B1796C275462A1703113804BB82D39DC0E3) ]] && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable --ruby
else
  rvm get stable
fi

# Node
# TODO: can this command be called multiple times? How to verify if needed?
# http://askubuntu.com/questions/182674/how-to-verify-if-a-repository-is-already-added
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# sudo apt-get install -y nodejs
if [[ ! -d $HOME/.nvm ]]; then
  git clone git@github.com:creationix/nvm.git $HOME/.nvm
else
  (cd $HOME/.nvm && git pull origin master && git checkout $(git describe --tags --abbrev=0))
fi

# TODO: save file with latest tags so that script can know when there is a change??
if [[ -r $HOME/.nvm/nvm.sh ]]; then
  NVM_DIR=$HOME/.nvm
  source $HOME/.nvm/nvm.sh
fi

if ! command -v node; then
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
# TODO: verify if -HE is correct when using pip with --user
if ! command -v pip3; then
  curl -sL https://bootstrap.pypa.io/get-pip.py | sudo -HE python3 -
else
  pip3 install --user --upgrade -r ~/dotfiles/requirements3.txt
fi

# TODO: Pandoc install
# manually installed stack repo. TODO: Test that stack is installed if not do it
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442
# echo 'deb http://download.fpcomplete.com/ubuntu xenial main'|sudo tee /etc/apt/sources.list.d/fpco.list
# TODO: save file with latest tags so that script can know when there is a change??
if [[ ! -d $HOME/code/pandoc ]]; then
  mkdir -p $HOME/code
  git clone --recursive https://github.com/jgm/pandoc $HOME/code/pandoc
  (cd $HOME/code/pandoc/src && stack setup)
  (cd $HOME/code/pandoc/src && stack install)
else
  (cd $HOME/code/pandoc && git pull --recurse-submodules origin master && \
    git checkout $(git describe --tags --abbrev=0))
  (cd $HOME/code/pandoc/src && stack install --local-bin-path=$HOME/bin/)
fi

# Mac OSX Only
#if [ "$(uname -s)" == 'Darwin' ]; then
if [ $OS == 'Darwin' ]; then
  # Vim 7.3 on Mac OSX does not have same default settings files as 7.4
  ln -sf $HOME/dotfiles/vim $HOME/.vim
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

