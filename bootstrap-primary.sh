#!/usr/bin/env bash
# install git, connect to git to clone dotfiles
# sudo apt update unecessary after add-apt-repository
if [[ ! -r ~/.ssh/id_ed25519.pub ]]; then
  ssh-keygen -t ed25519 -C "$USER@$HOSTNAME"
else
  echo "ed25519 key has already been generated"
fi
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git
# TODO: upload new ssh to github using api
# only do this step if folder does not exist
# git clone git@github.com:AntoniosHadji/dotfiles.git ~/.config/dotfiles
# git submodule init
# git submodule update

# other software
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install vim
sudo apt install python3-distutils
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
~/.local/bin/pip install --user ansible
# now ansible can be ran to install symlinks
# ~/.local/bin/ansible-playbook ansible/playbook.yml --limit "$(hostname).local"
