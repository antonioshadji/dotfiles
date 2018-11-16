#!/usr/bin/env bash
# -*- coding: utf-8 -*-
avconv -f x11grab -r 25 -s 1280x1024 -i :0.0+0,0 -vcodec libx264 -pre lossless_ultrafast -threads 0 video.mkv
