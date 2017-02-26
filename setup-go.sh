#!/usr/bin/env bash
# -*- coding: utf-8 -*-
sudo rm -rf /usr/local/go
# the filename of the latest go resides on https://golang.org/dl/
# <a class="download downloadBox" href="https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz">
# <div class="platform">Linux</div>
# <div class="reqs">Linux 2.6.23 or later, Intel 64-bit processor</div>
# <div>
#   <span class="filename">go1.8.linux-amd64.tar.gz</span>
#   <span class="size">(86MB)</span>
# </div>
# </a>
wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go*.linux-amd64.tar.gz
