#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# add PPA
sudo add-apt-repository ppa:oibaf/graphics-drivers

# remove PPA
# === Revert to original drivers ===
# To revert to standard Ubuntu drivers type the following in a prompt shell:
# $ sudo apt-get install ppa-purge
# $ sudo ppa-purge ppa:oibaf/graphics-drivers
