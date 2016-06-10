#!/usr/bin/env bash
# -*- coding: utf-8 -*-

MostCurrentTag=$(git describe --tags)
git checkout $MostCurrentTag
make distclean

./configure \
  --with-features=huge \
  --enable-python3interp=yes \
  --enable-luainterp=dynamic \
  --with-compiledby="Antonios Hadjigeorgalis"

