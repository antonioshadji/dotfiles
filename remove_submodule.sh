#!/usr/bin/env bash
# -*- coding: utf-8 -*-
if [[ -n $1 ]]; then
  git submodule deinit -f -- "${1}"
  git rm --cached "${1}"
  rmdir --verbose "${1}"
  echo "Continue with these instructions"
  echo "* remove entry in .gitmodules"
  echo "* rm -rf .git/modules/<path/to/submodule>"
  echo "* remove entry in .git/config"
  echo "* commit changes"


else
  echo "Must pass the folder location of the submodule"
fi


