#!/usr/bin/env bash

# this leaves monitor on 100% of time
xset s off
# disable power management turning off monitor
xset -dpms

# exec i3
# exec i3-with-shmlog
i3 -V -d all >> ~/.i3/logfile
# vim: set ft=sh:
