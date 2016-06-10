#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Download latest from this web page, then run script
# https://golang.org/dl/
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf ~/Downloads/go*.linux-amd64.tar.gz
