#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Update all submodules to latest master
git submodule foreach git checkout master
git submodule foreach git pull origin master

# update all nested submodules to git committed version
# git submodule update --recursive
# Or, set fetchRecurseSubmodules in .gitmodules
