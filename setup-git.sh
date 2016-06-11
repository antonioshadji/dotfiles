#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Git Configuration
sudo apt-get install -y git

git config --global user.email "Antonios@Hadji.co"
git config --global user.name "Antonios Hadjigeorgalis"
git config --global color.ui true
# simple is new default push method after Git 2.0
git config --global push.default simple
git config --global credential.helper 'cache --timeout=3600'
git config --global grep.linenumber true
git config --global grep.extendregexp true
git config --global alias.g 'grep --break --heading --line-number'
git config --global push.default simple
git config --global core.autocrlf input
git config --global status.branch true
git config --global status.short true
# http://haacked.com/archive/2014/07/28/github-flow-aliases/
# TODO: create aliases for
# git clone --recursive (always want to recurse submodules)
# git pull --recurse-submodules (always want latest submodule)

git clone --recursive git@github.com:AntoniosHadji/dotfiles.git
