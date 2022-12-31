#!/usr/bin/env bash
# -*- coding: utf-8 -*-
GREEN='\033[0;32m'
NC='\033[0m' # No Color#

# Update all submodules to latest master
git submodule update --recursive --remote

(cd ./bash-git-prompt && git checkout "$(git describe --abbrev=0 --tags)")
echo -e "${GREEN}completed bash-git-prompt update.${NC}"

(cd ./fzf && git checkout "$(git describe --abbrev=0 --tags)")
echo -e "${GREEN}completed fzf update.${NC}"

(cd ./nvm && git checkout "$(git describe --abbrev=0 --tags)")
echo -e "${GREEN}completed nvm update.${NC}"

(cd ./tmux/tmux-resurrect && git checkout "$(git describe --abbrev=0 --tags)" && git submodule update)
echo -e "${GREEN}completed tmux-resurrect update.${NC}"

(cd ./vim/pack/plugins/start/jedi-vim && git checkout "$(git describe --abbrev=0 --tags)")
(cd ./vim/pack/plugins/start/jedi-vim/pythonx/jedi && git submodule update)
echo -e "${GREEN}completed jedi-vim update.${NC}"

echo "================================================================================"
git submodule status
echo "================================================================================"

echo -e "${GREEN}finished.${NC}"
# For broken submodules, update submodules to git committed version
# git submodule update
