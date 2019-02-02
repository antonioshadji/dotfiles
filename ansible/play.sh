#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# ANSI Color Codes
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

# Yellow='\033[0;33m'
Reset='\033[0m'
# https://gist.github.com/HipsterJazzbo/6d9b933aaa4058cafe78
BASE03="\033[38;5;234m"
BASE02="\033[38;5;235m"
BASE01="\033[38;5;240m"
BASE00="\033[38;5;241m"
BASE0="\033[38;5;244m"
BASE1="\033[38;5;245m"
BASE2="\033[38;5;254m"
BASE3="\033[38;5;230m"
YELLOW="\033[38;5;136m"
ORANGE="\033[38;5;166m"
RED="\033[38;5;160m"
MAGENTA="\033[38;5;125m"
VIOLET="\033[38;5;61m"
BLUE="\033[38;5;34m"
CYAN="\033[38;5;37m"
GREEN="\033[38;5;64m"

if git diff-index --quiet HEAD; then
  ansible-playbook site.yml --ask-become-pass "$@"
else
  msg+="${YELLOW}"
  msg+="git repo is dirty, ansible will fail to run on this localhost"
  msg+="${Reset}\n"
  printf "%b" "$msg"
  git status --verbose
fi

# ansible-playbook site.yml -i hosts.yml --ask-become-pass --limit hadji.local
# -i inventory set in ansible.cfg
# --check dry-run
# --syntax-check to check syntax, do not execute
# -f, --fork default number of processes to run is 5.
