#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# xpath
# /html/body/main/div/a[3]
import os
import platform
import subprocess
import sys
from getpass import getpass
from pathlib import Path
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


def mac_install(fn: LiteralString) -> subprocess.CompletedProcess:
    """
    Install a macOS .pkg file with sudo privileges.

    Args:
        fn: Path to the .pkg file

    Returns:
        subprocess.CompletedProcess object with returncode, stdout, stderr

    Raises:
        FileNotFoundError: If the .pkg file doesn't exist
        ValueError: If filename doesn't end with .pkg
        RuntimeError: If not running on macOS

    macOS installer requires target parameter
        target: Target volume (default: "/" for root volume)

    This function written by Claude
    """
    target = "/"
    # Validate the package file
    pkg_path = Path(fn)

    if not pkg_path.exists():
        raise FileNotFoundError(f"Package file not found: {fn}")

    if not pkg_path.suffix.lower() == ".pkg":
        raise ValueError(f"File must be a .pkg file: {fn}")

    # Prompt for sudo password
    print(f"Installing {pkg_path.name}...")
    sudo_password = getpass("sudo password: ")

    # Build the installer command
    cmd = [
        "sudo",
        "-S",
        "installer",
        "-pkg",
        str(pkg_path.absolute()),
        "-target",
        target,
    ]

    # Run the installer
    try:
        proc = subprocess.run(
            cmd,
            input=sudo_password + "\n",
            capture_output=True,
            encoding="ascii",
            text=True,
        )

        # Print output for user feedback
        if proc.stdout:
            print(proc.stdout)

        if proc.returncode != 0:
            print(f"Installation failed with return code {proc.returncode}")
            if proc.stderr:
                print(f"Error: {proc.stderr}")
        else:
            print(f"Successfully installed {pkg_path.name}")

        return proc

    except Exception as e:
        raise RuntimeError(f"Failed to run installer: {e}")


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
