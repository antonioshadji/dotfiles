## Configuration

./configure \
  --enable-pythoninterp=dynamic \
  --enable-cscope \
  --enable-gui=auto \
  --enable-fontset \
  --with-compiledby="Antonios Hadjigeorgalis"

## Build Instructions
cd src
make distclean  # if you build Vim before
make
sudo make install
