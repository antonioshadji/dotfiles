#!/usr/bin/env bash
# -*- coding: utf-8 -*-
printf "\tfzf:"
go install github.com/junegunn/fzf@latest
printf "\tdocker-language-server:"
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
printf "\tov"
go install github.com/noborus/ov@latest
#
printf "\tInstall Fabric directly from the repo"
go install github.com/danielmiessler/fabric/cmd/fabric@latest

printf "\tkubernetes tools:"
# NOTE: The dev version will be in effect!
printf "\tk9s:"
go install github.com/derailed/k9s@latest
printf "\tstern:"
go install github.com/stern/stern@latest

printf "markdown rendering in terminal with glow:"
go install github.com/charmbracelet/glow/v2@latest
