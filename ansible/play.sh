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


# shellcheck disable=SC2034
__log_console() {
  local Reset='\033[0m'
  # https://gist.github.com/HipsterJazzbo/6d9b933aaa4058cafe78
  local BASE03="\033[38;5;234m"
  local BASE02="\033[38;5;235m"
  local BASE01="\033[38;5;240m"
  local BASE00="\033[38;5;241m"
  local BASE0="\033[38;5;244m"
  local BASE1="\033[38;5;245m"
  local BASE2="\033[38;5;254m"
  local BASE3="\033[38;5;230m"
  local YELLOW="\033[38;5;136m"
  local ORANGE="\033[38;5;166m"
  local RED="\033[38;5;160m"
  local MAGENTA="\033[38;5;125m"
  local VIOLET="\033[38;5;61m"
  local BLUE="\033[38;5;34m"
  local CYAN="\033[38;5;37m"
  local GREEN="\033[38;5;64m"

  local msg+="${YELLOW}"
  msg+="$1"
  msg+="${Reset}\n"
  printf "%b" "$msg"
}

if git diff-index --quiet HEAD; then
  ansible-playbook ./playbook.yml --ask-become-pass "$@"
else
  __log_console "git repo is dirty, ansible will fail to run on this localhost"
  git status --short
fi

# ansible-playbook playbook.yml -i inventory.yml --ask-become-pass --limit hadji.local
# -i inventory set in ansible.cfg
# --check dry-run
# --syntax-check to check syntax, do not execute
# -f, --fork default number of processes to run is 5.
