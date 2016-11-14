#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# MostCurrentTag=$(git describe --tags)
# git checkout $MostCurrentTag
# make distclean

./configure \
  --with-features=huge \
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
  --enable-luainterp=dynamic \
  --enable-perlinterp=dynamic \
  --enable-rubyinterp=dynamic \
  --enable-cscope \
  --enable-gui \
  --with-compiledby="Antonios Hadjigeorgalis"

