#!/usr/bin/env bash
# -*- coding: utf-8 -*-

make distclean
LATEST_TAG=$(git describe --tags)
echo $LATEST_TAG
sleep 3s
git checkout $LATEST_TAG

./configure \
  --with-features=huge \
  --enable-pythoninterp=dynamic \
  --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
  --enable-python3interp=dynamic \
  --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
  --enable-luainterp=dynamic \
  --enable-perlinterp=dynamic \
  --enable-rubyinterp=dynamic \
  --enable-cscope \
  --enable-gui \
  --enable-multibyte \
  --with-compiledby="Antonios Hadjigeorgalis"

if [ $? -eq 0 ]; then
  echo "successfully configured"
  make
fi

if [ $? -eq 0 ]; then
  echo "successfully made"
  sudo make install
fi

git checkout master
vim --version
