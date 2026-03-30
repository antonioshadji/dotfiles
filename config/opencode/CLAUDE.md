# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

This is the OpenCode configuration directory (`~/.config/opencode`). It contains multiple provider-specific config profiles and the oh-my-opencode plugin setup.

## Configuration Profiles

| File | Provider | Model |
|------|----------|-------|
| `opencode.json` | Active config (currently loaded by OpenCode) | Varies — whatever is swapped in |
| `bedrock-opencode.json` | Amazon Bedrock | Claude Opus 4.5 |
| `aic-opencode.json` | llamacpp (Anaconda Connect) | Qwen2.5-7B-Instruct |

To switch profiles, the contents of the desired profile are copied into `opencode.json`. All profiles share the same `$schema` (`https://opencode.ai/config.json`).

## oh-my-opencode Plugin

Configured in `oh-my-opencode.json`. Defines named agents (sisyphus, hephaestus, oracle, librarian, explore, multimodal-looker, prometheus, metis, momus, atlas) and task categories (visual-engineering, ultrabrain, deep, artistry, quick, writing, etc.), each mapped to a specific Bedrock model and optional variant.

The plugin is loaded via `"plugin": ["oh-my-opencode@latest"]` in the active config.

## Important

- **Never read, display, or reference `.env` contents.** It contains API keys.
- The `.gitignore` excludes `node_modules`, `package.json`, `bun.lock`, and itself — only the JSON configs and `.env` are meaningful files.
- The sole npm dependency is `@opencode-ai/plugin` (installed via bun).
