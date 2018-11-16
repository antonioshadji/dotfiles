#!/usr/bin/env bash
# -*- coding: utf-8 -*-
avconv -f x11grab -r 25 -s 1920x1080 -i :0.0+1280,0 -vcodec libx264 -pre lossless_ultrafast -threads 0 video.mkv
