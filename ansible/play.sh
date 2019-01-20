#!/usr/bin/env bash
# -*- coding: utf-8 -*-

ansible-playbook site.yml -i hosts.yml --ask-become-pass

# ansible-playbook site.yml -i hosts.yml --ask-become-pass --limit hadji.local
# --check dry-run
# --syntax-check to check syntax, do not execute
# -f, --fork default number of processes to run is 5.
