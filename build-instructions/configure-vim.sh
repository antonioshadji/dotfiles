#!/usr/bin/env bash
# -*- coding: utf-8 -*-

MostCurrentTag=$(git describe --tags)
git checkout $MostCurrentTag
make distclean

./configure \
  --with-features=huge \
  --enable-pythoninterp=yes \
  --enable-luainterp=yes \
  --with-compiledby="Antonios Hadjigeorgalis"

