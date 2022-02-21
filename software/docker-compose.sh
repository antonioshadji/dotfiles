#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# https://docs.docker.com/compose/cli-command/#install-on-linux
# https://github.com/docker/compose/releases
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
