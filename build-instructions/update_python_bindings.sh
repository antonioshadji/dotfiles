#!/usr/bin/env bash
# -*- coding: utf-8 -*-

if [[ $# -eq 0 ]] ; then
    echo 'Must include version number in #.# format as argument'
    exit 0
fi
if [ ! -d "./build_v${1}" ] 
then
  echo "Build directory ./build_v${1} not found."
  exit 0
fi

PYTHON="python3.10"
GNUCASH="${1}"

mkdir -p "${HOME}/.local/lib/${PYTHON}/site-packages/gnucash"
rm -rf "${HOME}/.local/lib/${PYTHON}/site-packages/gnucash/__pycache__/"
cp --recursive --verbose "./build_v${GNUCASH}/lib/${PYTHON}/site-packages/gnucash" "${HOME}/.local/lib/${PYTHON}/site-packages"
