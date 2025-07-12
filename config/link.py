#!/usr/bin/env python3

from pathlib import Path

path = Path('.')

for f in path.iterdir():
    if f.suffix != '.py':
        temp = Path.home() / '.config' / Path(f"{f}-new")
        link = Path.home() / '.config' / Path(f)
        target = Path.cwd() / Path(f)

        temp.symlink_to(target)
        temp.rename(link) 

        print(f"Symbolic link '{link}' created, pointing to '{target}'.")

