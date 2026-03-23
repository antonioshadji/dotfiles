# Update linux_home Function Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Update `link.py` to create real directories for top-level folders in `home/` and symlink their contents.

**Architecture:** Use `pathlib` to iterate through `home/`. For files, maintain existing symlink logic. For directories, create the target directory and then symlink its immediate children using their original names.

**Tech Stack:** Python 3, `pathlib`

---

### Task 1: Create Reproduction/Test Script

**Files:**
- Create: `tests/reproduce_link_issue.py`

- [ ] **Step 1: Write a test script that sets up a mock environment**

```python
import os
import shutil
from pathlib import Path
import importlib.util

def setup_mock_env():
    # Setup mock source
    src_dir = Path("mock_repo")
    src_dir.mkdir(exist_ok=True)
    home_src = src_dir / "home"
    home_src.mkdir(parents=True, exist_ok=True)
    
    (home_src / "test_file.txt").write_text("file content")
    nested_dir = home_src / "test_folder"
    nested_dir.mkdir(exist_ok=True)
    (nested_dir / "nested_file.txt").write_text("nested content")
    (nested_dir / "subfolder").mkdir(exist_ok=True)
    (nested_dir / "subfolder" / "deep_file.txt").write_text("deep content")
    
    # Setup mock home
    mock_home = Path("mock_home")
    if mock_home.exists():
        shutil.rmtree(mock_home)
    mock_home.mkdir()
    
    return src_dir, mock_home

def test_link_home(src_dir, mock_home):
    # This is a placeholder for the logic we will move into a testable function or mock
    print("Testing link_home logic...")
    # ... logic to be tested ...
```

- [ ] **Step 2: Run the script to verify it sets up correctly**

Run: `python3 tests/reproduce_link_issue.py`
Expected: Directories `mock_repo` and `mock_home` are created.

- [ ] **Step 3: Commit**

```bash
git add tests/reproduce_link_issue.py
git commit -m "test: add reproduction script for linux_home update"
```

### Task 2: Implement and Verify New linux_home Logic

**Files:**
- Modify: `link.py`

- [ ] **Step 1: Update `linux_home` in `link.py`**

```python
def linux_home():
    path = Path("home")
    print(f"Linking {path}")

    for f in path.iterdir():
        # Target in home directory with a dot prefix
        link = Path.home() / Path(f".{f.name}")
        target = Path.cwd() / Path(f)

        if target.is_dir():
            # Create real directory if it is a folder in home/
            print(f"Creating directory -> {link}")
            link.mkdir(parents=True, exist_ok=True)
            # Link contents of the folder
            for item in target.iterdir():
                item_link = link / item.name
                item_target = item
                try:
                    if item_link.exists() or item_link.is_symlink():
                        item_link.unlink()
                    item_link.symlink_to(item_target)
                    print(f"  Created -> {item_link}")
                except Exception as e:
                    print(f"  Error linking {item.name}: {e}")
        else:
            # Existing logic for files
            temp = Path.home() / Path(f".{f.name}-new")
            try:
                if temp.is_file() or temp.is_symlink():
                    temp.unlink()
                temp.symlink_to(target)
                temp.rename(link)
                print(f"Created -> {link}")
            except Exception as e:
                print(f"Error creating symlink: {e}")
                sys.exit(1)
```

- [ ] **Step 2: Verify implementation with reproduction script**

Update `tests/reproduce_link_issue.py` to import and run the new logic (mocking `Path.home()` and `Path.cwd()`).

- [ ] **Step 3: Run the verification**

Run: `python3 tests/reproduce_link_issue.py`
Expected: `~/.test_folder` is a directory, `~/.test_folder/nested_file.txt` is a symlink.

- [ ] **Step 4: Commit**

```bash
git add link.py
git commit -m "feat: update linux_home to handle nested directories"
```

### Task 3: Cleanup and Final Verification

- [ ] **Step 1: Remove reproduction script and mock directories**

Run: `rm -rf mock_repo mock_home tests/reproduce_link_issue.py`

- [ ] **Step 2: Final manual check of link.py**

- [ ] **Step 3: Commit cleanup**

```bash
git commit -m "cleanup: remove reproduction artifacts"
```
