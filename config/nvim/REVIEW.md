# init.lua Review

**Session ID:** `ses_03119da1effe8Mdsjy8Pcyx7LM`  
**Date:** 2026-08-04  
**Neovim version:** v0.11.5

---

## Verified Bugs

### 1. Treesitter "skip large files" feature silently never works (lines 197–204)

```lua
disable = function(_, buf)
  local max_filesize = 100 * 1024
  local ok, stats = pcall(vim.fs.exists, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end,
```

**Problem:** `vim.fs.exists` doesn't exist in Neovim 0.11. The `pcall` call fails with "attempt to call a nil value," so `ok` is always `false`, and the whole condition short-circuits. No error is shown, but the size check never runs. The existing `TODO` comment on line 194 ("how to fix fs_stat not found error") confirms this was already partially noticed.

**Fix:**

```lua
disable = function(_, buf)
  local max_filesize = 100 * 1024
  local name = vim.api.nvim_buf_get_name(buf)
  local stat = vim.uv.fs_stat(name)
  return stat and stat.size > max_filesize
end,
```

`vim.uv.fs_stat` returns `nil` for a nonexistent file (no `pcall` needed) and a table with `.size` when it exists.

### 2. `vim.g.updatetime = 500` in `autocmds.lua:23` does nothing

**Problem:** `vim.g.X` sets a `g:` variable, not an option. Verified: `vim.o.updatetime` still reads `4000` after full config load. The `CursorHold` diagnostic popup is firing at Neovim's default 4000ms, not the intended 500ms.

**Fix (in `lua/autocmds.lua`):**

```lua
vim.opt.updatetime = 500  -- or vim.o.updatetime = 500
```

---

## Organization

### Section headers

`keymaps.lua` uses clear `-- ===...===` banners; `init.lua` doesn't. Given it mixes options, colorscheme, and 5+ plugin `setup()` calls, banners for `-- Options`, `-- Colorscheme`, `-- Completion`, `-- LSP`, `-- Treesitter`, `-- Modules` would make it scannable.

### Dead documentation block (lines 240–258)

The commented-out "Alternative: Even More Modular" tree is 18 lines of aspirational structure you've already partially implemented (`lua/keymaps.lua`, `lua/autocmds.lua`, top-level `lsp/*.lua` per the 0.11 auto-load convention). Either act on it or move it to a `NOTES.md`/README — it adds no value sitting at the bottom of `init.lua`.

### `wildignore:append` called 4 times (lines 31–34)

Could be one call with a merged list; the repeated calls with trailing `-- "` (a leftover Vimscript comment marker, meaningless in Lua) read as copy-paste cruft:

```lua
vim.opt.wildignore:append({
  ".hg", ".git", ".svn",
  "*.jpg", "*.bmp", "*.gif", "*.png", "*.jpeg",
  "*.o", "*.obj", "*.exe", "*.dll", "*.manifest",
  "*.DS_Store",
})
```

### No Windows netrw branch (lines 17–22)

The comment mentions `'start'` for Windows but there's no third branch. Fine to leave since you only run macOS/Ubuntu, but the comment is now misleading — either implement the third branch or drop the Windows mention.

### Stale comment (line 72)

`-- 2024-02-10 ... highly experimental zx should fix folding issues` is two years old. Worth confirming it's still needed or removing.

---

## Plugin Management: Native `pack/` vs. `lazy.nvim`

All 17 plugins are **git submodules under `pack/plugins/start/`** (eager-loaded), with nothing in `pack/plugins/opt/`. Every plugin — including filetype-specific ones like `rustaceanvim`, `go.nvim`, `nvim-dap`, and `telescope` + `telescope-fzf-native` — loads its `plugin/` and `ftplugin/` scripts on *every* Neovim startup, regardless of whether you're editing Rust/Go or invoking DAP/Telescope that session.

### Trade-offs

| | Native `pack/` (current) | `lazy.nvim` |
|---|---|---|
| Startup cost | Everything loads eagerly; no lazy-loading primitives beyond manual `opt/` + `:packadd` | Built-in lazy-loading by `ft`, `cmd`, `event`, `keys` — direct fix for the rustaceanvim/go.nvim/dap issue |
| Installs/updates | Already well-managed via git submodules (pinned SHAs, `git submodule update`) | Own lockfile (`lazy-lock.json`) + `:Lazy sync`; overlaps with what submodules already give |
| Missing-plugin resilience | `require("go")`, `require("lualine")`, etc. in `init.lua` have no guard — a missing/broken submodule aborts the rest of `init.lua` | Auto-installs missing plugins on startup |
| Migration cost | None | Non-trivial: rewrite 17 plugin specs, decide what stays submoduled vs. `lazy`-installed, re-verify LSP/treesitter/cmp wiring |

### Recommendation

Since you're already getting reproducible installs from submodules, a full `lazy.nvim` migration mostly buys you lazy-loading and a nicer UI, at the cost of migrating a system that works. A lower-effort middle ground that keeps your submodule workflow: move rarely-used, filetype-specific plugins (`rustaceanvim`, `go.nvim`, `nvim-dap`) into `pack/plugins/opt/` and lazy-load them with a small `FileType`/`cmd` autocmd calling `vim.cmd.packadd(...)`. That's a ~20-line addition to `autocmds.lua`, no new dependency, and directly addresses the "everything loads on every startup" issue.

If you want the nicer `:Lazy` UI/health checks/lockfile more than you want to keep submodules, that's the case for actually switching.

### Startup resilience

None of the `require("go")`, `require("lualine")`, `require("nvim-tmux-navigation")`, `require("colorizer")` calls (lines 122, 219–223) are guarded. If a submodule is missing/broken (e.g., fresh clone before `git submodule update --init`), the first failing `require` throws and aborts the rest of `init.lua`, including your own `keymaps`/`autocmds`/`lastplace`/`dailynotes` modules loaded afterward. Wrapping each in a small helper would make failures isolated and visible instead of silently killing the rest of your config:

```lua
local function safe_require(mod, fn)
  local ok, err = pcall(fn or function() require(mod) end)
  if not ok then
    vim.notify(("init.lua: failed to load %s: %s"):format(mod, err), vim.log.levels.ERROR)
  end
end
```

---

## Minor/Cosmetic

- **Line 1 typo:** "good example init fsiles" → "files".
- **Line 34 comment:** "OSX bullshit" — harmless in a personal dotfile, but flagging since it's now effectively public-facing in the file.
- **`vim.opt.omnifunc` (line 71):** Redundant with modern `vim.lsp.enable(...)`, which sets buffer-local `omnifunc` on `LspAttach` automatically. Safe to remove, though harmless to keep as a fallback for buffers without an attached client.