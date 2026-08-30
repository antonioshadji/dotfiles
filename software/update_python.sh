#!/usr/bin/env bash
python3 -m pip install --upgrade -r requirements-py3-global.txt
uv self update
uv tool update --all
