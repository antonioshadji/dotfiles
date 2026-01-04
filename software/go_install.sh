#!/usr/bin/env bash
# -*- coding: utf-8 -*-
go install github.com/junegunn/fzf@latest
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
go install github.com/noborus/ov@latest
# Install Fabric directly from the repo
go install github.com/danielmiessler/fabric/cmd/fabric@latest
