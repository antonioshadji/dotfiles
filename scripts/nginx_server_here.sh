#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# generate random number between 8100 8200
# $RANDOM is built in bash variable (not safe for cryptography)
# https://www.gnu.org/software/bash/manual/bashref.html#index-RANDOM
# % is modulo operator
PORT=$(($(($RANDOM%100))+8100))
NAME=$(basename $(pwd))
if [ $NAME = 'src' ]; then
  # go up one directory level for name
  NAME=$(basename $(dirname $(realpath .)))
fi

# if [ $NAME = 'final_project' ]; then
#   PORT=8042
# elif [ $PORT -eq 8042 ]; then
#   PORT=$PORT+100
# fi

NAME=ws-$NAME-$PORT

# using --mount instead of -v
# 2018-08-13 12:41:57 -0400 not tested
# https://docs.docker.com/storage/bind-mounts/#start-a-container-with-a-bind-mount
# --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html,readonly \
# -v => --volume
#  -v $(pwd):/usr/share/nginx/html:ro \
docker run --rm --name $NAME \
  --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html,readonly \
  -p $PORT:80 \
  -d nginx

if [ $? -eq 0 ]; then
  echo "serving $NAME on: http://localhost:${PORT}"
fi
