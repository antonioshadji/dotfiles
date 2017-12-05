#!/usr/bin/env bash

# set script to exit if any command fails
# http://stackoverflow.com/a/90441/2472798
set -e
set -o pipefail

# get latest tag from git repo
git checkout master
git pull
#REPO=$(git describe --abbrev=0)
REPO=2.6.18
git checkout $REPO

# add variable to restrict language files to only british english
# this stops building of all languages (worked with en_GB)
export LINGUAS=en_US

./autogen.sh

# Create a separate build directory for each build
if [[ -d "build_$REPO" ]]; then
  mkdir "build_$REPO-$(date +%y%m%d%H%M)"
  cd "build_$REPO-$(date +%y%m%d%H%M)"
else
  mkdir "build_$REPO"
  cd "build_$REPO"
fi

../configure --prefix=/opt/gnucash --enable-compile-warnings \
  --enable-python --enable-ofx --enable-aqbanking \
  --enable-doxygen --enable-html-docs --enable-debug

make
# checkinstall creates deb package
# https://help.ubuntu.com/community/CheckInstall
# http://checkinstall.izto.org/docs/README
sudo checkinstall --pkgname=gnucash --pkgversion=1:$REPO --default
