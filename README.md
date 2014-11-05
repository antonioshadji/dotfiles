Dotfiles
========
This is my dot files collection for cloning my Ubuntu Linux configuration.

setup.git
=========
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/startup-class/setup.git
./setup/setup.sh   
```

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.

TODO:
=====
[X] Vundle must be git cloned before it can manage other plugins  
[X] Vundle interface change requires update to .vimrc.bundles  
[ ] configure tmux https://github.com/christoomey/vim-tmux-navigator  
[ ] convert solarize.sh to python script (add to fabfile.py)  
[ ] create fabfile for workstation setup tasks  
