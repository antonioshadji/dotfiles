http://www.vim.org/git.php

## Build Instructions
cd src  
# symlink from dotfiles/build-instructions/  
./configure-vim.sh  
# if Vim was previously compiled  
make distclean  
make  
sudo make install
