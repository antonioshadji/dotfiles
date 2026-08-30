#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Runner script for software setup and maintenance scripts.
Executes all bash scripts and golang.py in the current directory sequentially.
Captures any errors and automatically triggers `agy` (Antigravity CLI) with a
one-shot prompt flag (-p) to diagnose and fix the failure, outputs a summary, and exits.
"""

from __future__ import annotations

import argparse
import os
import shlex
import subprocess
import sys
import time
from pathlib import Path
from typing import NamedTuple


class ScriptResult(NamedTuple):
    name: str
    command: list[str]
    returncode: int
    duration_seconds: float
    error_output: str
    agy_invoked: bool
    agy_returncode: int | None


def discover_scripts(base_dir: Path) -> list[Path]:
    """
    Discover all *.sh scripts and golang.py in the directory,
    sorted with a logical dependency priority (e.g. core runtimes first).
    """
    priority_order = [
        "update_python.sh",
        "npm.packages.sh",
        "golang.py",
        "aws.sh",
        "update_glab.sh",
        "update_nvim.sh",
        "go_tools_install.sh",
        "rust_tools_install.sh",
    ]

    found: dict[str, Path] = {}
    current_file = Path(__file__).resolve()

    # Discover bash scripts
    for p in sorted(base_dir.glob("*.sh")):
        if p.is_file() and p.resolve() != current_file:
            found[p.name] = p

    # Discover golang.py
    go_py = base_dir / "golang.py"
    if go_py.is_file() and go_py.resolve() != current_file:
        found[go_py.name] = go_py

    # Order according to priority, appending any unlisted scripts at the end
    ordered: list[Path] = []
    for name in priority_order:
        if name in found:
            ordered.append(found.pop(name))

    for remaining in sorted(found.values(), key=lambda p: p.name):
        ordered.append(remaining)

    return ordered


def build_command_for_script(script_path: Path) -> list[str]:
    """Return the command line to execute the target script."""
    if script_path.suffix == ".py":
        return [sys.executable, str(script_path)]
    return ["bash", str(script_path)]


def run_script_with_streaming_capture(
    cmd: list[str], cwd: Path
) -> tuple[int, str, float]:
    """
    Run command while streaming stdout and stderr in real-time,
    and capturing all output for error analysis.
    """
    start_time = time.perf_counter()
    captured_lines: list[str] = []

    process = subprocess.Popen(
        cmd,
        cwd=cwd,
        stdin=sys.stdin,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1,
        universal_newlines=True,
    )

    if process.stdout:
        for line in iter(process.stdout.readline, ""):
            sys.stdout.write(line)
            sys.stdout.flush()
            captured_lines.append(line)
        process.stdout.close()

    process.wait()
    duration = time.perf_counter() - start_time
    captured_text = "".join(captured_lines)

    return process.returncode, captured_text, duration


def trigger_agy_repair(
    script_path: Path, cmd: list[str], returncode: int, error_output: str
) -> int:
    """
    Start agy with the one-shot prompt flag (-p) to fix the script.
    """
    abs_path = script_path.resolve()
    cmd_str = " ".join(shlex.quote(arg) for arg in cmd)

    # Keep recent error lines to avoid exceeding prompt size if output is huge
    lines = error_output.strip().splitlines()
    if len(lines) > 200:
        clipped_output = "\n".join(
            lines[:50] + ["\n... [truncated] ...\n"] + lines[-150:]
        )
    else:
        clipped_output = error_output.strip()

    prompt = f"""Fix the execution error in the script: file://{abs_path}

Command executed:
{cmd_str}

Exit Code:
{returncode}

Captured Execution Output & Error:
```text
{clipped_output}
```

Instructions:
1. Inspect the script file: file://{abs_path}
2. Analyze the root cause of the error shown above.
3. Edit and fix the code in the file.
4. Test the fix if feasible.
5. Provide a concise summary of the changes made.
"""

    print("\n" + "=" * 80)
    print("🤖 STARTING AGY AUTO-REPAIR...")
    print(f"Target: {abs_path}")
    print("=" * 80 + "\n")

    agy_cmd = [
        "agy",
        "--dangerously-skip-permissions",
        "--mode",
        "accept-edits",
        "-p",
        prompt,
    ]

    try:
        res = subprocess.run(agy_cmd, cwd=abs_path.parent, check=True)
        return res.returncode
    except FileNotFoundError:
        print("Error: 'agy' command not found on PATH.", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error invoking agy: {e}", file=sys.stderr)
        return 1


def print_summary(results: list[ScriptResult], total_duration: float) -> None:
    """Print a clean execution summary table."""
    print("\n" + "=" * 80)
    print(f"{'EXECUTION SUMMARY':^80}")
    print("=" * 80)
    print(f"{'Script':<35} {'Status':<18} {'Duration':<12} {'Auto-Repair'}")
    print("-" * 80)

    for r in results:
        if r.returncode == 0:
            status = "✅ SUCCESS"
        else:
            status = f"❌ FAILED ({r.returncode})"

        dur = f"{r.duration_seconds:.2f}s"

        if r.agy_invoked:
            if r.agy_returncode == 0:
                repair = "🔧 AGY Ran (Exit 0)"
            else:
                repair = f"⚠️ AGY Exit ({r.agy_returncode})"
        else:
            repair = "-"

        print(f"{r.name:<35} {status:<18} {dur:<12} {repair}")

    print("-" * 80)
    total_passed = sum(1 for r in results if r.returncode == 0)
    print(
        f"Total: {len(results)} scripts | Passed: {total_passed} | Failed: {len(results) - total_passed}"
    )
    print(f"Total Time: {total_duration:.2f}s")
    print("=" * 80 + "\n")


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Run all bash scripts and golang.py with automatic agy error diagnosis."
    )
    parser.add_argument(
        "--continue-on-error",
        action="store_true",
        help="Continue running remaining scripts if a script fails.",
    )
    parser.add_argument(
        "--no-agy",
        action="store_true",
        help="Do not trigger agy on failure.",
    )
    parser.add_argument(
        "--only",
        type=str,
        help="Run only the specified script name (e.g. 'aws.sh' or 'golang.py').",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="List discovered scripts and exit without executing.",
    )

    args = parser.parse_args()
    base_dir = Path(__file__).resolve().parent

    scripts = discover_scripts(base_dir)

    if args.only:
        scripts = [s for s in scripts if s.name == args.only]
        if not scripts:
            print(
                f"Error: Script '{args.only}' not found in {base_dir}", file=sys.stderr
            )
            return 1

    if not scripts:
        print(f"No matching scripts found in {base_dir}")
        return 0

    if args.dry_run:
        print(f"Discovered {len(scripts)} scripts to execute in {base_dir}:")
        for i, s in enumerate(scripts, 1):
            cmd = build_command_for_script(s)
            print(f"  {i}. {s.name:<30} -> {' '.join(cmd)}")
        return 0

    print("=" * 80)
    print(f"Running {len(scripts)} software scripts in: {base_dir}")
    print("=" * 80)

    results: list[ScriptResult] = []
    overall_start = time.perf_counter()

    for idx, script in enumerate(scripts, 1):
        cmd = build_command_for_script(script)
        print(f"\n[{idx}/{len(scripts)}] 🚀 Running: {script.name} ({' '.join(cmd)})")
        print("-" * 80)

        retcode, output, duration = run_script_with_streaming_capture(cmd, base_dir)

        agy_invoked = False
        agy_ret: int | None = None

        if retcode != 0:
            print(f"\n❌ Error: '{script.name}' exited with returncode {retcode}")

            if not args.no_agy:
                agy_invoked = True
                agy_ret = trigger_agy_repair(script, cmd, retcode, output)

            results.append(
                ScriptResult(
                    name=script.name,
                    command=cmd,
                    returncode=retcode,
                    duration_seconds=duration,
                    error_output=output,
                    agy_invoked=agy_invoked,
                    agy_returncode=agy_ret,
                )
            )

            if not args.continue_on_error:
                print(
                    "\nStopping execution due to error (use --continue-on-error to proceed anyway)."
                )
                break
        else:
            print(f"✅ Finished: {script.name} in {duration:.2f}s")
            results.append(
                ScriptResult(
                    name=script.name,
                    command=cmd,
                    returncode=0,
                    duration_seconds=duration,
                    error_output="",
                    agy_invoked=False,
                    agy_returncode=None,
                )
            )

    total_duration = time.perf_counter() - overall_start
    print_summary(results, total_duration)

    all_passed = all(r.returncode == 0 for r in results)
    return 0 if all_passed else 1


if __name__ == "__main__":
    sys.exit(main())
