#!/usr/bin/env bash
# -*- coding: utf-8 -*-

ansible-playbook site.yml -i hosts.yml --ask-become-pass
