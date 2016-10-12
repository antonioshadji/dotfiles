#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# MostCurrentTag=$(git describe --tags)
# git checkout $MostCurrentTag
# make distclean

./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
  --enable-python3interp \
  --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
  --enable-luainterp=dynamic \
  --enable-perlinterp \
  --enable-cscope \
  --enable-gui=gtk2 \
  --with-compiledby="Antonios Hadjigeorgalis"

