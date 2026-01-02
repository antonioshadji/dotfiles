#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# xpath
# /html/body/main/div/a[3]
import os
import platform
import subprocess
import sys
from getpass import getpass
from typing import LiteralString, cast

import httpx
from lxml import html

BASE = "https://go.dev"
client = httpx.Client(follow_redirects=True)


def get_content() -> str:
    r = client.get(f"{BASE}/dl/")
    tree = html.fromstring(r.content)
    return tree


def construct_file_specifier():
    osname = sys.platform
    arch = platform.machine()
    specifier = f"{osname}-{arch}"

    if specifier != "linux-amd64":
        print(f"This script only works for {specifier} at this time.")
        exit()

    return specifier


def find_file(tree) -> str:
    file_specifier = construct_file_specifier()
    # /html/body/main/article/div[1]/a[5]
    for link in tree.xpath("/html/body/main/article/div[1]/a"):
        if file_specifier in link.xpath("@href")[0]:
            return link.xpath("@href")[0]

    return ""


def mac_install(fn: LiteralString) -> None:
    """Not Implemented"""
    print(fn)


def linux_install(fn: LiteralString) -> None:
    cmd0 = "sudo mv /opt/go /opt/go_old".split()
    cmd1 = "sudo tar -C /opt -xzf".split()
    cmd1.append(fn)

    pw = getpass("sudo password: ")

    proc = subprocess.run(cmd0, capture_output=True, input=pw, encoding="ascii")
    print(proc)
    if proc.returncode == 0:
        proc = subprocess.run(cmd1, capture_output=True, input=pw, encoding="ascii")
        print(proc)
        os.remove(fn)


def execute_installer(fn: LiteralString) -> None:
    if construct_file_specifier() == "linux-amd64":
        linux_install(fn)
    else:
        mac_install(fn)


def main():
    tree = get_content()
    url = find_file(tree)
    print(url)

    fn: LiteralString = cast(
        LiteralString, url.split("/")[-1]
    )  # this is one way to fix typing error, TODO: how to disable for all servers?

    r = client.get(f"{BASE}url")
    open(fn, "wb").write(r.content)

    subprocess.run(["go", "version"])

    execute_installer(fn)

    subprocess.run(["go", "version"])


if __name__ == "__main__":
    main()
