#!/usr/bin/env bash
# -*- coding: utf-8 -*-
F=/home/antonios/terminal-color.log
echo "systemd-test.sh" >> $F
echo $(date) >> $F
echo $DBUS_SESSION_BUS_ADDRESS >> $F
echo $DISPLAY >> $F
echo "systemd-test.sh run completed" >> $F

