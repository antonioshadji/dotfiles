#!/usr/bin/env bash
# -*- coding: utf-8 -*-

make distclean
LATEST_TAG=$(git describe --tags)
echo $LATEST_TAG
sleep 3s
git checkout $LATEST_TAG

./configure \
  --enable-luainterp=dynamic \
  --enable-python3interp=yes \
  --enable-cscope \
  --enable-terminal \
  --enable-autoservername \
  --enable-multibyte \
  --enable-gui \
  --with-features=huge \
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
