#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Set up environment if necessary
if [ -z $DISPLAY ]; then
  export DISPLAY=:0
fi
if [ -z $DBUS_SESSION_BUS_ADDRESS ]; then
  PID=$(pgrep gnome-session)
  export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
fi

echo "systemd-test.sh" >> $1
echo $(date) >> $1
echo $DBUS_SESSION_BUS_ADDRESS >> $1
echo $DISPLAY >> $1
echo "systemd-test.sh run completed" >> $1
