Dotfiles
========

**WORK IN PROGRESS**  
transfer all configuration to ansible scripts.  

This is my dot files collection for cloning my Linux configuration files  

The starting point for these files was http://github.com/startup-class/dotfiles.  

These files are also setup to work on Mac OSX (El Capitan)  

I'm attempting to use git submodules to include the work of others.
Check out https://github.com/magicmonty/bash-git-prompt for a great bash prompt.

:TODO set terminal profile font to size 14

To use powerline fonts in virtual terminal (ctrl-alt-f1)
``` bash
sudo cp fonts/Terminus/PSF/*.gz /usr/share/consolefonts/
```
To set this font as the default, I edited `/etc/default/console-setup`
 - comment out `FONTFACE`
 - comment out `FONTSIZE`
 - set `FONT='ter-powerline-v22n.psf.gz'`


use this code in `.bashrc` to always update dotfiles to latest version on login
```bash

#!/usr/bin/env bash
# -*- coding: utf-8 -*-
## -----------------------------
## -- 0) update dotfiles
## -----------------------------
if [ -d "$HOME/dotfiles" ]; then
git -C $HOME/dotfiles pull --recurse-submodules
git -C $HOME/dotfiles submodule update --recursive --init
fi
```

- create ssh-keys
  - https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent
  - ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  - sudo apt-get install -y xclip
  - cat ~/.ssh/id_rsa.pub | xclip -i -selection clipboard
  - Manually add ssh key to github
  - run setup-git.sh

Solarized Color Scheme comes with gnome-terminal in 16.04
it must be selected as both the color scheme and the palette separately to work as before
.dircolors still required when pallette is switched, other wise it can be removed if standard pallette used.
?? standard palette breaks vim color scheme ??

TODO:
Firefox Developer Edition Link to tar.bz2 file
https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=linux64&lang=en-US


#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Download latest from this web page, then run script
# https://golang.org/dl/
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf ~/Downloads/go*.linux-amd64.tar.gz

this following code snippet does not update the submodules to the latest.
bash prompt is updated regularly

#!/usr/bin/env bash
# -*- coding: utf-8 -*-
git pull --recurse-submodules
# this will update all submodules to latest, keeping local work if on local branch
git submodule update --remote --rebase


