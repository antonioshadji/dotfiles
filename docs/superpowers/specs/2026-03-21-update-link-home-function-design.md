# Spec: Update link_home Function in link.py

## Overview
Update the `linux_home` function in `link.py` to handle nested file structures more gracefully. Currently, the function symlinks top-level items from `home/` to `~/.item_name`. This spec defines a change to ensure that directories inside `home/` are created as real directories in the target, while their contents are symlinked.

## Requirements
- Top-level files in `home/` continue to be linked as `~/.filename`.
- Top-level directories in `home/` (e.g., `home/foo/`) should result in a real directory `~/.foo/`.
- Files and subfolders *within* those top-level directories should be symlinked into the target directory with their original names (no dot prefix).
- The implementation should follow existing `pathlib` patterns in `link.py`.

## Design

### 1. Iteration Strategy
- Use `Path("home").iterdir()` to iterate through all top-level items.

### 2. File Handling (Top Level)
- For each file `f` in `home/`:
  - Target: `Path.home() / f".{f.name}"`
  - Create symlink pointing to `Path.cwd() / f`.
  - Use the "link-to-temp-then-rename" pattern for atomic updates if applicable, or simply overwrite if it's a symlink.

### 3. Directory Handling (Top Level)
- For each directory `d` in `home/`:
  - Target Dir: `Path.home() / f".{d.name}"`
  - Ensure `Target Dir` exists using `mkdir(parents=True, exist_ok=True)`.
  - Iterate through items `i` in `d.iterdir()`:
    - Link Target: `Target Dir / i.name`
    - Link Source: `Path.cwd() / i`
    - Create symlink for `i` (whether it is a file or a nested directory).

### 4. Safety and Error Handling
- Check for existing files/directories at the link target.
- If a target is an existing file (not a symlink), provide a warning or skip (following local conventions).
- The script should be idempotent; running it multiple times should result in the same state.

## Testing Strategy
- Manual verification: Create a mock `home/` directory with nested files and folders.
- Run `link.py` (or a test version) and verify:
  1. Top-level files are correctly dotted and linked.
  2. Top-level folders are created as real directories with a dot prefix.
  3. Contents of those folders are linked with original names.
