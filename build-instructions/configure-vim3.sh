#!/usr/bin/env bash
# -*- coding: utf-8 -*-

make distclean

./configure \
  --with-features=huge \
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
  --enable-luainterp=dynamic \
  --enable-perlinterp=dynamic \
  --enable-rubyinterp=dynamic \
  --enable-cscope \
  --enable-gui \
  --with-vim-name=vim3 \
  --with-ex-name=ex3 \
  --with-view-name=view3 \
  --with-compiledby="Antonios Hadjigeorgalis"

