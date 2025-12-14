#!/usr/bin/env bash
# -*- coding: utf-8 -*-
export GTEST_ROOT=/mnt/projects/Environment/software/googletest
# options found in CMakeList.txt in toplevel src directory
# ############################################################
# These options are settable from the CMake command line. For example, to disable
# SQL, put -D WITH_SQL=OFF on the command line.

# option (WITH_SQL "Build this project with SQL (libdbi) support" ON)
# option (WITH_AQBANKING "Build this project with aqbanking (online banking and a variety of file import formats) support" ON)
# option (WITH_GNUCASH "Build all of GnuCash, not just the library" ON)
# option (WITH_OFX "compile with ofx support (needs LibOFX)" ON)
# option (WITH_PYTHON "enable python plugin and bindings" OFF)
# option (ENABLE_BINRELOC "compile with binary relocation support" ON)
# option (DISABLE_NLS "do not use Native Language Support" OFF)
# option (COVERAGE "Instrument a Debug or Asan build for coverage reporting" OFF)
# option (GUILE_COVERAGE "Compute testing coverage of Scheme code. WARNING: 15X slowdown!" OFF)
# option (LEAKS "Report leaks for tests in a non-Apple Asan build." OFF)
# option (ODR "Report One Definition Rule violations in tests in a non-Apple Asan build." OFF)

# mkdir build-gnucash-4.<x>                # create the build directory - Note: Named to identify the source since it is not within the source directory.
# cd build-gnucash-4.<x>                   # change into the build directory
# cmake -GNinja -DCMAKE_INSTALL_PREFIX=$HOME/opt ../gnucash-4.<x>     # As shown this will install in the opt directory in /home/<user>.  
# ninja                                    # builds the program and associated libraries
# ninja install                            # prefix with sudo if you do install to /usr/local or /opt as admin privileges are required.

cmake \
  -G Ninja \
  -D WITH_PYTHON=ON \
  -D WITH_AQBANKING=OFF \
  -D WITH_OFX=OFF \
  -D CMAKE_INSTALL_PREFIX=/opt \
  -D CMAKE_BUILD_TYPE=RelWithDebInfo \
  ../gnucash
