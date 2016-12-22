#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "START systemd-test.sh" >> $1
echo $(date) >> $1
# Set up environment if necessary
if [ -z $DISPLAY ]; then
  export DISPLAY=:0
  echo "DISPLAY was not set." >> $1
else
  echo "DISPLAY=$DISPLAY" >> $1
fi

if [ -z $DBUS_SESSION_BUS_ADDRESS ]; then
  PID=$(pgrep gnome-session)
  export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
  echo "DBUS_SESSION_BUS_ADDRESS attempted. result=$DBUS_SESSION_BUS_ADDRESS" >> $1
else
  echo "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" >> $1
fi

echo "END systemd-test.sh" >> $1
