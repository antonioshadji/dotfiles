#!/usr/bin/env bash
# -*- coding: utf-8 -*-
  ## -----------------------------
  ## -- 0) update dotfiles
  ## -----------------------------
  if [ -d "$HOME/dotfiles" ]; then
    git -C $HOME/dotfiles pull --recurse-submodules
    git -C $HOME/dotfiles submodule update --recursive --init
  fi


