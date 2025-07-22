#!/usr/bin/env python3
import platform
import shutil
import sys
from datetime import datetime
from pathlib import Path


def linux_local():
    path = Path("local/share")
    print(f"Linking {path}")

    for f in path.iterdir():
        link = Path.home() / Path(f".{f}")
        target = Path.cwd() / Path(f)

        # Check if target exists and is a directory
        if not target.exists() or not target.is_dir():
            print(f"Error: Target '{target}' does not exist or is not a directory.")
            sys.exit(1)

        # Backup existing link or directory at link
        if link.exists() and link.is_dir():
            try:
                if link.is_dir() and not link.is_symlink():
                    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                    backup_path = link.parent / f"{link.name}_backup_{timestamp}"
                    print(f"Backing up existing path '{link}' to '{backup_path}'")
                    shutil.move(str(link), str(backup_path))
                else:
                    link.unlink()
            except Exception as e:
                print(f"Error creating backup: {e}")
                sys.exit(1)

        # Create the symlink
        try:
            link.symlink_to(target, target_is_directory=True)
            print(f"Created -> {link}")
        except Exception as e:
            print(f"Error creating symlink: {e}")
            sys.exit(1)


def linux_home():
    path = Path("home")
    print(f"Linking {path}")

    for f in path.iterdir():
        link = Path.home() / Path(f".{f.name}")
        temp = Path.home() / Path(f".{f.name}-new")
        target = Path.cwd() / Path(f)

        try:
            temp.symlink_to(target)
            temp.rename(link)
            print(f"Created -> {link}")
        except Exception as e:
            print(f"Error creating symlink: {e}")
            sys.exit(1)


def linux_config():
    path = Path("config")
    print(f"Linking {path}")

    for f in path.iterdir():
        temp = Path.home() / Path(f".{f}-new")
        link = Path.home() / Path(f".{f}")
        target = Path.cwd() / Path(f)

        try:
            temp.symlink_to(target)
            temp.rename(link)
            print(f"Created -> {link}")
        except Exception as e:
            print(f"Error creating symlink: {e}")
            sys.exit(1)

    alacritty_config()

def alacritty_config():
    # TODO: symlink linux or macos to os.toml
    pass

if __name__ == "__main__":
    if platform.system() == "Linux":
        linux_local()
        linux_home()
        linux_config()

    else:
        print(f"script not designed for {platform.system()} system")
        print("Exiting...")
        exit()
