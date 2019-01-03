#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# these lines cause make check to fail
# export GTEST_ROOT=/mnt/projects/csdiy/programming-1/c++/googletest/build/googlemock/gtest/
# export GMOCK_ROOT=/mnt/projects/csdiy/programming-1/c++/googletest/build/googlemock/
#-DCMAKE_INSTALL_PREFIX=/opt/gnucash34 causes failed install can't find libraries
cmake -DWITH_PYTHON=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
