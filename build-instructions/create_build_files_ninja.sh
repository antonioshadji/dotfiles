#!/usr/bin/env bash
# -*- coding: utf-8 -*-
export GTEST_ROOT=/mnt/projects/software/googletest
# options found in CMakeList.txt in toplevel src directory
cmake \
  -D WITH_PYTHON=ON \
  -D CMAKE_BUILD_TYPE=RelWithDebInfo \
  -GNinja \
  ../gnucash
#  "$(dirname "$(pwd)")/gnucash"

# compiles successfully
#   -D CMAKE_INSTALL_PREFIX=/opt \
