#!/usr/bin/env bash

# 2021-01-02 18:27:02 this does not appear to work same as when set in i3 config
# this leaves monitor on 100% of time
# xset s off
# disable power management turning off monitor
# xset -dpms

# exec i3
# exec i3-with-shmlog
# dbus-run-session -- i3 -V -d all >> "$HOME/.i3/logfile_$(date +%FT%H%M).log"
# i3 -V -d all >> "$HOME/.i3/logfile_$(date +%FT%H%M).log"
i3
# vim: set ft=sh:
# awesome
# https://dbus.freedesktop.org/doc/dbus-run-session.1.html


# debug log is located on /dev/shm/i3-*.log
