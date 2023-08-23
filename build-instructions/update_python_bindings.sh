#!/usr/bin/env bash
# -*- coding: utf-8 -*-
PYTHON="python3.10"
GNUCASH="5.3"
mkdir -p "${HOME}/.local/lib/${PYTHON}/site-packages/gnucash"
cp --recursive "./build_v${GNUCASH}/lib/python3/dist-packages/gnucash" "${HOME}/.local/lib/${PYTHON}/site-packages"
