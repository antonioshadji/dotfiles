#!/usr/bin/env bash

make distclean
git checkout master
git pull
REPO=$(git describe --abbrev=0)
git checkout $REPO
read -n1 -r -p "Repo updated -- Press space to run autogen..." key

./autogen.sh
read -n1 -r -p "autogen completed -- Press space to create build directory..." key

[[ -d "build_$REPO" ]] && rm -rf "build_$REPO"
mkdir "build_$REPO"
cd "build_$REPO"
export LINGUAS=en
read -n1 -r -p "build sub-dir created -- Press space to configure..." key
../configure --enable-python --enable-ofx --enable-aqbanking
#  --enable-debug --enable-dependency-tracking --enable-compile-warnings=yes

#  --prefix=/opt/gnucash  install to custom location
#  --enable-compile-warnings  reccomended in instructions
#  --enable-python         enable python plugin and bindings
#  --enable-ofx            compile with ofx support (needs LibOFX)
#  --enable-aqbanking      compile with AqBanking support
#  --enable-debug          compile with debugging flags set
#   --enable-dependency-tracking
read -n1 -r -p "Configured -- Press space to make..." key

#if [ "$key" = ' ' ]; then
    # Space pressed, do something
#else
    # Anything else pressed, do whatever else.
#fi

make
echo $0
read -n1 -r -p "Made -- Press space to install..." key
sudo make install
