#!/usr/bin/env bash
if [[ ! -r ~/.ssh/id_ed25519.pub ]]; then
  ssh-keygen -t ed25519
else
  echo "ed25519 key has already been generated"
fi
# TODO: upload new ssh to github using api
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:jonathonf/vim
# sudo apt update unecessary, above lines update by default
sudo apt install git 
sudo apt install vim 
sudo apt install python3-distutils
wget https://bootstrap.pypa.io/get-pip.py 
python3 get-pip.py --user
~/.local/bin/pip install --user ansible
git clone --recurse-submodules git@github.com:AntoniosHadji/dotfiles.git .dotfiles
