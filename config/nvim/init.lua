-- good example init fsiles
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
vim.opt.wildignore:append({ ".hg", ".git", ".svn" }) -- " Version control
vim.opt.wildignore:append({ "*.jpg", "*.bmp", "*.gif", "*.png", "*.jpeg" }) -- " binary images
vim.opt.wildignore:append({ "*.o", "*.obj", "*.exe", "*.dll", "*.manifest" }) -- " compiled object files
vim.opt.wildignore:append({ "*.DS_Store" }) -- " OSX bullshit

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

-- Setup Completion
-- https://neovim.io/doc/user/lsp.html#lsp-completion

-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  --  snippet = {
  --    expand = function(args)
  --      vim.fn["vsnip#anonymous"](args.body)
  --    end,
  --  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),

    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<C-e>"] = cmp.mapping.close(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
})

-- Set up lspconfig.
-- NOTE: new setup for v0.11+
vim.lsp.enable({
  "bashls",
  "luals",
  "ruff",
  -- "basedpyright",
  "pyright",
  "pyrefly",
  "ts_ls",
  "gopls",
  -- "rust_analyzer", https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#zap-quick-setup
  "clangd",
  "dockerls",
  "racket_langserver", -- https://raw.githubusercontent.com/neovim/nvim-lspconfig/refs/heads/master/lsp/racket_langserver.lua
})

require("nvim-treesitter.configs").setup({
  -- missing-fields error in lsp without this
  modules = {},
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
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
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  -- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- TODO: how to fix fs_stat not found error, but breaks vim api recognition
    --
    -- signature: (language, buffer)
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      -- https://neovim.io/doc/user/luaref.html#pcall()
      local ok, stats = pcall(vim.fs.exists, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  -- :h nvim-treesitter-modules
  incremental_selection = { enable = true },
  indent = { enable = true },
  textobjects = { enable = true },
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
require("colorizer").setup(
  --   DEFAULT_OPTIONS = {
  --  RGB      = true;         -- #RGB hex codes
  --  RRGGBB   = true;         -- #RRGGBB hex codes
  --  names    = true;         -- "Name" codes like Blue
  --  RRGGBBAA = false;        -- #RRGGBBAA hex codes
  --  rgb_fn   = false;        -- CSS rgb() and rgba() functions
  --  hsl_fn   = false;        -- CSS hsl() and hsla() functions
  --  css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --  css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --  -- Available modes: foreground, background
  --  mode     = 'background'; -- Set the display mode.
  --   }
  { "*" },
  { mode = "foreground" }
)

-- ## Alternative: Even More Modular
--
-- If you have many plugins, you could go further:
--
-- lua/
-- ├── core/
-- │   └── keymaps.lua           # All global keymaps
-- ├── plugins/
-- │   ├── telescope.lua
-- │   ├── lsp.lua
-- │   └── treesitter.lua
-- └── config/
--     ├── telescope/
--     │   ├── setup.lua         # Telescope setup
--     │   ├── keymaps.lua       # Telescope keymaps
--     │   └── pickers.lua       # Custom picker functions
--     └── options.lua           # Vim options
