#!/usr/bin/env bash
# -*- coding: utf-8 -*-
printf "\tfzf:\n"
go install github.com/junegunn/fzf@latest
printf "\tdocker-language-server:\n"
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
printf "\tov:\n"
go install github.com/noborus/ov@latest
printf "\tInstall Fabric directly from the repo:\n"
go install github.com/danielmiessler/fabric/cmd/fabric@latest
printf "\tkubernetes tools:\n"
# NOTE: The dev version will be in effect!
printf "\tk9s:\n"
go install github.com/derailed/k9s@latest
printf "\tstern:\n"
go install github.com/stern/stern@latest
printf "\tmarkdown rendering in terminal with glow:\n"
go install github.com/charmbracelet/glow/v2@latest
printf "\tOfficial X API tool:\n"
go install github.com/xdevplatform/xurl@latest
