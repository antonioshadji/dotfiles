#!/usr/bin/env bash
# -*- coding: utf-8 -*-

if [[ $# -eq 0 ]] ; then
    echo 'Must include version number in #.# format as argument'
    exit 0
fi
if [ ! -d "./build_v${1}_stable" ] 
then
  echo "Build directory ./build_v${1}_stable not found."
  exit 0
fi

PYTHON="python3.12"
GNUCASH="${1}"

rm -rf "/usr/local/lib/${PYTHON}/site-packages/gnucash"
cp --recursive --verbose "./build_v${GNUCASH}_stable/lib/${PYTHON}/site-packages/gnucash" "/usr/local/lib/${PYTHON}/site-packages"
