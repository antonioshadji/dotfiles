#!/usr/bin/env bash
sudo python3 -m pip install --upgrade meson
meson -Ddocs=true -Dmans=true ..
ninja
sudo ninja install
