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


def get_content() -> html.HtmlElement:
    r = client.get(f"{BASE}/dl/")
    tree = html.fromstring(r.content)
    return tree


def construct_file_specifier() -> str:
    osname = sys.platform
    arch = platform.machine()
    if arch == "x86_64":
        arch = "amd64"
    elif arch == "aarch64":
        arch = "arm64"

    specifier = f"{osname}-{arch}"

    if specifier not in ("linux-amd64", "darwin-arm64", "darwin-amd64"):
        print(f"Unsupported system: {specifier}")
        sys.exit(1)

    return specifier


def find_file(tree: html.HtmlElement) -> str:
    file_specifier = construct_file_specifier()
    # /html/body/main/article/div[1]/a[5]
    for link in tree.xpath("/html/body/main/article/div[1]/a"):
        href = link.xpath("@href")
        if href and file_specifier in href[0]:
            return href[0]

    return ""


def run_sudo(cmd: list[str]) -> subprocess.CompletedProcess:
    # Check if sudo can run without a password prompt
    check_sudo = subprocess.run(["sudo", "-n", "true"], capture_output=True)
    if check_sudo.returncode == 0:
        return subprocess.run(["sudo"] + cmd, capture_output=True, text=True)

    if sys.stdin.isatty():
        pw = getpass("sudo password: ")
        return subprocess.run(
            ["sudo", "-S"] + cmd,
            input=pw + "\n",
            capture_output=True,
            text=True,
        )
    else:
        return subprocess.run(["sudo", "-n"] + cmd, capture_output=True, text=True)


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

    print(f"Installing {pkg_path.name}...")
    cmd = ["installer", "-pkg", str(pkg_path.absolute()), "-target", target]

    try:
        proc = run_sudo(cmd)

        # Print output for user feedback
        if proc.stdout:
            print(proc.stdout)

        if proc.returncode != 0:
            print(f"Installation failed with return code {proc.returncode}")
            if proc.stderr:
                print(f"Error: {proc.stderr}")
        else:
            print(f"Successfully installed {pkg_path.name}")
            if os.path.exists(fn):
                os.remove(fn)

        return proc

    except Exception as e:
        raise RuntimeError(f"Failed to run installer: {e}")


def linux_install(fn: LiteralString) -> None:
    print(f"Installing {fn} to /opt/go...")

    # 1. Clean up previous backup if present
    if Path("/opt/go_old").exists():
        run_sudo(["rm", "-rf", "/opt/go_old"])

    # 2. Move existing /opt/go to /opt/go_old as backup
    if Path("/opt/go").exists():
        proc = run_sudo(["mv", "/opt/go", "/opt/go_old"])
        if proc.returncode != 0:
            print(f"Error moving /opt/go to /opt/go_old: {proc.stderr}")
            return

    # 3. Extract new archive to /opt
    proc = run_sudo(["tar", "-C", "/opt", "-xzf", fn])
    if proc.returncode != 0:
        print(f"Error extracting {fn}: {proc.stderr}")
        # Try to restore backup if extraction failed
        if not Path("/opt/go").exists() and Path("/opt/go_old").exists():
            run_sudo(["mv", "/opt/go_old", "/opt/go"])
        return

    print(f"Successfully extracted {fn} to /opt/go")
    if os.path.exists(fn):
        os.remove(fn)


def execute_installer(fn: LiteralString) -> None:
    if sys.platform == "linux":
        linux_install(fn)
    elif sys.platform == "darwin":
        mac_install(fn)
    else:
        print(f"Unsupported OS: {sys.platform}")
        sys.exit(1)


def print_go_version() -> None:
    try:
        proc = subprocess.run(["go", "version"], capture_output=True, text=True)
        if proc.returncode == 0:
            print(proc.stdout.strip())
        else:
            print(proc.stderr.strip())
    except FileNotFoundError:
        if Path("/opt/go/bin/go").exists():
            proc = subprocess.run(["/opt/go/bin/go", "version"], capture_output=True, text=True)
            print(proc.stdout.strip())
        else:
            print("go binary not found in PATH or /opt/go/bin/go")


def main():
    tree = get_content()
    url = find_file(tree)
    if not url:
        print("Could not find matching Go download file.")
        sys.exit(1)
    print(f"Found download URL: {url}")

    fn: LiteralString = cast(
        LiteralString, url.split("/")[-1]
    )  # this is one way to fix typing error, TODO: how to disable for all servers?

    print(f"Downloading {BASE}{url}...")
    r = client.get(f"{BASE}{url}")
    with open(fn, "wb") as f:
        f.write(r.content)

    print("Current Go version:")
    print_go_version()

    execute_installer(fn)

    print("Updated Go version:")
    print_go_version()


if __name__ == "__main__":
    main()
