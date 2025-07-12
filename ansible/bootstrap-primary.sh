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

# now ansible can be ran to install symlinks
# comma after localhost distiguishes between file expected and list of hosts
ansible-playbook --connection=local --inventory 'localhost,' ansible/playbook.yml --tags dotfiles,common --ask-become-pass
