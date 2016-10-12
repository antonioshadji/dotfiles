#!/usr/bin/env bash
# -*- coding: utf-8 -*-

MostCurrentTag=$(git describe --tags)
git checkout $MostCurrentTag
make distclean

./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp=yes \
  --enable-luainterp=dynamic \
  --enable-perlinterp \
  --enable-cscope \
  --enable-gui=gtk2 \
  --with-compiledby="Antonios Hadjigeorgalis"
