#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#
if command -v uv 2>&1 > /dev/null
  then
    echo "uv already installed"
    uv self update
  else
    echo "uv not installed"
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
source $HOME/.local/share/../bin/env

uv tool install ruff
uv tool install pyrefly
