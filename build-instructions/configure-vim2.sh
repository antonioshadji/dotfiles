#!/usr/bin/env bash
# -*- coding: utf-8 -*-

make distclean

./configure \
  --with-features=huge \
  --enable-pythoninterp=yes \
  --enable-luainterp=dynamic \
  --enable-perlinterp=dynamic \
  --enable-rubyinterp=dynamic \
  --enable-cscope \
  --enable-gui \
  --with-vim-name=vim2 \
  --with-ex-name=ex2 \
  --with-view-name=view2 \
  --with-compiledby="Antonios Hadjigeorgalis"
