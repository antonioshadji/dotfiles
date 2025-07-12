#!/usr/bin/env python3

from pathlib import Path

path = Path('.')

for f in path.iterdir():
    if f.is_file and f.suffix != '.py':
        link = Path.home() / Path(f".{f}")
        temp = Path.home() / Path(f".{f}-new")
        target = Path.cwd() / Path(f)

        temp.symlink_to(target)
        temp.rename(link) 

        print(f"Symbolic link '{link}' created, pointing to '{target}'.")

