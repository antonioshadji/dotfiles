#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Update all submodules to latest master
git submodule foreach git checkout master
git submodule foreach git pull origin master

cd nvm || echo "Failed to find nvm folder."; exit 1
git checkout "$(git describe --abbrev=0 --tags --match 'v[0-9]*')"
cd ..

cd fzf || echo "Failed to find fzf folder."; exit 2
git checkout "$(git describe --abbrev=0 --tags)"

# update all nested submodules to git committed version
# git submodule update --recursive
# Or, set fetchRecurseSubmodules in .gitmodules
