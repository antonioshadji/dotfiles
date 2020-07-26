#!/usr/bin/env bash
# -*- coding: utf-8 -*-
git submodule foreach git checkout master
git submodule foreach git pull origin master
