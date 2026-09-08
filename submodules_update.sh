#!/usr/bin/env bash
# -*- coding: utf-8 -*-
GREEN='\033[0;32m'
NC='\033[0m' # No Color#

# init new submodules
git submodule init
# Update all submodules to latest master
git submodule update --remote

# (cd ./bash-git-prompt && git checkout "$(git describe --abbrev=0 --tags)")
# echo -e "${GREEN}completed bash-git-prompt update.${NC}"
#
# (cd ./fzf && git checkout master)
# echo -e "${GREEN}completed fzf update.${NC}"
#
# (cd ./nvm && git checkout "$(git describe --abbrev=0 --tags)")
# echo -e "${GREEN}completed nvm update.${NC}"
#
# (cd ./tmux/tmux-resurrect && git checkout "$(git describe --abbrev=0 --tags)" && git submodule update)
# echo -e "${GREEN}completed tmux-resurrect update.${NC}"
#
# (cd ./vim/pack/plugins/start/jedi-vim && git checkout "$(git describe --abbrev=0 --tags)")
# (cd ./vim/pack/plugins/start/jedi-vim/pythonx/jedi && git submodule update)
# (cd ./vim/pack/plugins/start/jedi-vim/pythonx/parso && git submodule update)
# (cd ./vim/pack/plugins/start/jedi-vim && git submodule update)
# echo -e "${GREEN}completed jedi-vim update.${NC}"

echo "================================================================================"
git submodule status
echo "================================================================================"

get_shared_lib_ext() {
  case "$(uname -s)" in
    Darwin*) echo "dylib" ;;
    *) echo "so" ;;
  esac
}

build_blink_cmp() {
  local target_dir="$1"
  local ext="$2"
  if [ -d "${target_dir}" ]; then
    echo "Building blink.cmp native library..."
    (
      cd "${target_dir}" || exit 1
      cargo build --release
      mkdir -p lib
      ln -sf "../target/release/libblink_cmp_fuzzy.${ext}" "lib/libblink_cmp_fuzzy.${ext}"
    )
  fi
}

build_telescope_fzf() {
  local target_dir="$1"
  if [ -d "${target_dir}" ]; then
    echo "Building telescope-fzf-native..."
    (
      cd "${target_dir}" || exit 1
      make
    )
  fi
}

ext="$(get_shared_lib_ext)"
build_blink_cmp "./config/nvim/pack/plugins/start/blink.cmp" "${ext}"
build_telescope_fzf "./config/nvim/pack/plugins/start/telescope-fzf-native.nvim"

echo -e "${GREEN}finished.${NC}"
# For broken submodules, update submodules to git committed version
# git submodule update

# https://github.com/nvim-telescope/telescope.nvim
# telescope.nvim should be set to branch 0.1.x to follow releases
# not needed anylonger ? 2026-09-07
# (cd ./config/nvim/pack/plugins/start/telescope.nvim/ && git switch 0.1.x)
