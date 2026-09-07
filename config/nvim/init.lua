-- good example init files
-- https://github.com/potamides/dotfiles

-- vim.inspect prints tables
-- lua =vim.opt.runtimepath

-- no config when running inside vscode
if vim.g.vscode then
  return
end

-- Set leader keys (must be set before any keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ('open' for macOS, 'xdg-open' for Linux, 'start' for Windows).
if vim.fn.has("mac") == 1 then
  vim.g.netrw_browser_viewer = "open"
end
if vim.fn.has("linux") == 1 then
  vim.g.netrw_browser_viewer = "xdg-open"
end

-- disabled 2026-01-19 18:36:27 Monday
-- vim.opt.packpath = vim.opt.runtimepath:get()

-- spell file location inside ~/.config/nvim
vim.opt.spellfile = ("%s/spell/spf.%s.add"):format(vim.fn.stdpath("config"), vim.o.encoding)

-- add files to ignore
vim.opt.wildignore:append({
  ".hg",
  ".git",
  ".svn",
  "*.jpg",
  "*.bmp",
  "*.gif",
  "*.png",
  "*.jpeg",
  "*.o",
  "*.obj",
  "*.exe",
  "*.dll",
  "*.manifest",
  "*.DS_Store",
})

-- Write files when many actions, including switching buffers see :help awa
vim.opt.autowriteall = true

vim.opt.clipboard = { "unnamed", "unnamedplus" }

vim.opt.cursorline = true -- Highlight current line default is off
vim.opt.showmatch = true -- jump cursor to matching brace when entered default is off
vim.opt.ignorecase = true -- case-insensitive search  \C at end to force case-sensitive
vim.opt.smartcase = true -- use case sensitive search if any caps present
vim.opt.wrap = false -- default is on
-- "nvim defaults to tab:> ,trail:-,nbsp:+
vim.opt.listchars = { tab = "› ", trail = "∙", nbsp = "†", extends = "»", precedes = "«" }
vim.opt.list = true
vim.opt.colorcolumn = "80"
vim.opt.showmode = false
vim.opt.diffopt:append({ "vertical", "iwhite" })

vim.opt.expandtab = true -- expands tabs to spaces
vim.opt.shiftwidth = 2 -- number of spaces to use for autoindent
vim.opt.tabstop = 2 -- actual tabs occupy # spaces
vim.opt.softtabstop = 2 -- insert mode tab and backspace
vim.opt.splitright = true -- puts new vsplit windows to the right
vim.opt.splitbelow = true -- puts new hsplit windows below current

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
-- defaults are "fuzzy" "menu"
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
-- 2024-02-10 08:12:34 highly experimental zx should fix folding issues
vim.opt.foldminlines = 4
-- vim.opt.foldnestmax
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.termguicolors = true
vim.cmd.colorscheme("solarized_lua")

-- Setup Completion with blink.cmp
local blink = require("blink.cmp")
blink.setup({
  keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },

    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },

    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<C-f>"] = { "scroll_documentation_up", "fallback" },
  },

  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  signature = { enabled = true },
})

-- Apply blink.cmp capabilities to all LSP servers in Neovim 0.11/0.12
vim.lsp.config("*", {
  capabilities = blink.get_lsp_capabilities(),
})

require("go").setup({})

-- Set up lspconfig.
-- NOTE: new setup for v0.11+
vim.lsp.enable({
  "bashls",
  "luals",
  -- "basedpyright",
  "pyright",
  -- "pyrefly",
  "ruff",
  "ts_ls",
  "gopls",
  -- "rust_analyzer", https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#zap-quick-setup
  "clangd",
  "dockerls",
  "racket_langserver", -- https://raw.githubusercontent.com/neovim/nvim-lspconfig/refs/heads/master/lsp/racket_langserver.lua
})

require("nvim-treesitter").install({
  "c", -- required
  "cmake",
  "comment",
  "cpp",
  "css",
  "dockerfile",
  "gitcommit",
  "go",
  "html",
  "javascript",
  "json",
  "lua", --required
  "make",
  "markdown", --required
  "python",
  "query",
  "rust",
  "sql",
  "toml",
  "typescript",
  "vim", --required
  "vimdoc", --required
  "yaml",
  "markdown_inline", --required
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterAutoStart", { clear = true }),
  callback = function(args)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stat = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stat and stat.size > max_filesize then
      return
    end
    pcall(vim.treesitter.start, args.buf)
  end,
})

require("keymaps")
require("autocmds")
-- script to reset cursor to last position on last save
require("lastplace")
-- daily note configuration
require("dailynotes")

require("lualine").setup({ options = { theme = "powerline" } })
require("nvim-tmux-navigation").setup({
  disable_when_zoomed = true, -- defaults to false
})
require("colorizer").setup({ "*" }, { mode = "foreground" })
