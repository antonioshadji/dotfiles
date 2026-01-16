-- good example init fsiles
-- https://github.com/potamides/dotfiles
if vim.g.vscode then
  return
end
-- remove dependence on vim plugins 2024-03-26 13:26:40
-- vim.opt.runtimepath:prepend(vim.env.HOME .. "/.vim")
vim.opt.packpath = vim.opt.runtimepath:get()

-- spell file location inside ~/.config/nvim
vim.opt.spellfile = ("%s/spell/spf.%s.add"):format(vim.fn.stdpath("config"), vim.o.encoding)

-- add files to ignore
-- vim.opt.wildignore:append({ ".hg", ".git", ".svn" }) -- " Version control
-- vim.opt.wildignore:append({ "*.jpg", "*.bmp", "*.gif", "*.png", "*.jpeg" }) -- " binary images
-- vim.opt.wildignore:append({ "*.o", "*.obj", "*.exe", "*.dll", "*.manifest" }) -- " compiled object files
-- vim.opt.wildignore:append({ "*.spl" }) -- " compiled spelling word lists
-- vim.opt.wildignore:append({ "*.sw?" }) -- " Vim swap files
-- vim.opt.wildignore:append({ "*.DS_Store" }) -- " OSX bullshit
-- vim.opt.wildignore:append({ "*.luac" }) -- " Lua byte code
-- vim.opt.wildignore:append({ "*.pyc" }) -- " Python byte code
-- vim.opt.wildignore:append({ "*.class" }) -- " Java byte code

vim.opt.exrc = true -- Allow local vimrc files inside projects (for c/cpp)
vim.opt.secure = true -- do not allow autocmds in project specific vimrc
vim.opt.autowriteall = true -- Write files when many actions, including switching buffers see :help awa

vim.opt.clipboard = { "unnamed", "unnamedplus" }

vim.opt.cursorline = true -- Highlight current line default is off
vim.opt.showmatch = true -- jump cursor to matching brace when entered default is off
vim.opt.ignorecase = true -- case-insensitive search  \C at end to force case-sensitive
vim.opt.smartcase = true -- use case sensitive search if any caps present
vim.opt.wrap = false -- default is on

vim.opt.listchars = { tab = "› ", trail = "∙", nbsp = "†", extends = "»", precedes = "«" } -- "nvim defaults to tab:> ,trail:-,nbsp:+
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

-- vim.inspect prints tables
-- lua vim.print(vim.opt.packpath)
-- lua vim.print(vim.opt.runtimepath)
-- lua =vim.opt.runtimepath

--[[ Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
--]]

-- Avoid showing extra messages when using completion
-- vim.cmd('set shortmess+=c')
-- vim.opt.shortmess:append("c")

vim.opt.completeopt = { "menuone", "noselect", "popup" } -- "fuzzy" "menu"

vim.opt.number = true
vim.opt.relativenumber = true

if vim.fn.has("mac") == 1 then
  vim.g.netrw_browser_viewer = "open"
  -- ('open' for macOS, 'xdg-open' for Linux, 'start' for Windows).
end
if vim.fn.has("linux") == 1 then
  vim.g.netrw_browser_viewer = "xdg-open"
end

-- vim.cmd([[
-- " Set updatetime for CursorHold
-- " 300ms of no cursor movement to trigger CursorHold
-- " set updatetime=300
-- " Show diagnostic popup on cursor hover
-- " autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
--
-- " Goto previous/next diagnostic warning/error
-- " nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
-- " nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
-- ]])

-- Keyboard Shortcuts
-- vim.cmd([[
-- " help abbreviate
-- " Abbreviations:
-- " iabbrev <expr> dts strftime('%F %T')
--
-- " Mappings:
-- " When you have a problem about vim mappings.
-- " Check :verbose inoremap at the first.
-- " If you know the keys which have problem,
-- " then do it with specified key, for example :verbose inoremap <esc>.
--
-- " http://vim.wikia.com/wiki/Avoid_the_escape_key
-- " ** alt + any key will exit insert mode and execute key action hl jk etc
-- " <C-c> is an alternative to Esc but does not run autocmd by default
-- " this mapping makes <C-c> execute Esc so autocmd runs
-- " imap <C-c> <Esc>
-- " shift enter works in gvim, not in gnome-terminal
-- " enter ^M, s-enter ^M, c-enter <NL>
-- " https://stackoverflow.com/questions/598113/can-terminals-detect-shift-enter-or-control-enter
-- " imap <S-Enter> <Esc>
-- " CTRL_J will replace <CR> in insert mode
-- " imap <CR> <Esc><CR>
--
-- " leave insert mode when moving between lines
-- " imap <Up> <Esc><Up>
-- " imap <Down> <Esc><Down>
--
-- "http://www.bestofvim.com/tip/leave-ex-mode-good/
-- " <Nop> is no operation
-- " map Q q
--
-- " Easy window navigation
-- " nnoremap <C-h> <C-w>h
-- " nnoremap <C-j> <C-w>j
-- " nnoremap <C-k> <C-w>k
-- " nnoremap <C-l> <C-w>l
-- " nnoremap <C-left> <C-w>h
-- " nnoremap <C-down> <C-w>j
-- " nnoremap <C-up> <C-w>k
-- " nnoremap <C-right> <C-w>l
--
-- " http://vimcasts.org/episodes/how-to-fold/
-- " use space bar in normal mode to toggle folds
-- " TODO: is there a better use for space bar?
-- " nnoremap <Space> za
-- "
-- " This unsets the 'last search pattern' register by hitting return
-- " http://stackoverflow.com/a/662914/2472798
-- " nnoremap <silent> <CR> :noh<CR>
--
-- " http://www.jovicailic.org/2015/05/saving-read-only-files-in-vim-sudo-trick/
-- " http://www.geekyboy.com/archives/629
-- " http://vim.wikia.com/wiki/Multiple_commands_at_once
-- " cmap w!! w !sudo tee %
-- " vertical terminal
-- " cmap vt vert terminal
-- " terminal in new tab
-- " issues when using search replace
-- " cmap tt tab terminal
--
-- "from defaults.vim
-- " CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- " so that you can undo CTRL-U after inserting a line break.
-- " Revert with ":iunmap <C-U>".
-- " TODO: verify if this is needed
-- " inoremap <C-U> <C-G>u<C-U>
--
-- " workaround for netrw bug  :help netrw-debug
-- " https://github.com/vim/vim/issues/4738#issuecomment-521506447
-- " https://github.com/vim/vim/issues/4738#issuecomment-565330300
-- " TODO: verify if this is needed
-- " let g:netrw_nogx=1
-- " TODO: this only works on linux!!
-- " nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>
-- ]])

-- Custom commands & functions
-- vim.cmd([[
-- " Update Last Modified line when editing pandoc {
-- " If buffer modified, update any 'modified: ' in the first 20 lines
-- " 'modified: ' can have up to 10 characters before (they are retained).
-- " Restores cursor and window position using save_cursor variable.
-- " vim magic on by default - all lower case matches any case
-- " . concatenates without a space between
-- " getftime returns modified time of file name
-- " @% returns active buffer file name
-- " function! LastModified()
-- "   " comment out &modified if using getftime()
-- "   "  if &modified
-- "   let save_cursor = getpos('.')
-- "   " minimum of 20 lines or file length
-- "   let n = min([20, line('$')])
-- "   " requires space after modified:
-- "   keepjump execute '1,' . n . 's#^\(.\{,10}modified: \).*#\1' .
-- "         \ strftime('%c') . '#e'
-- "   call histdel('search', -1)
-- "   call setpos('.', save_cursor)
-- "   echom 'updated last modified date'
-- "   "  endif
-- " endfunction
-- "}
-- " DEPRECATED: use telescope live grep
-- " Searching with RipGrep {
-- " https://robots.thoughtbot.com/faster-grepping-in-vim#override-to-use-the-silver-searcher
-- " https://github.com/ggreer/the_silver_searcher
-- " if executable('rg')
-- "   " use rg instead of silver searcher
-- "   set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
-- "   set grepformat="%f:%l:%c:%m"
-- " endif
-- "}
-- " DEPRECATED: use Justfile for start/stop webserver
-- " Start/Stop nginx webserver in current pwd {
-- " https://hub.docker.com/_/nginx/
-- " command! StartWebServer !docker run -d --name $(basename $(pwd)) -v $(pwd):/usr/share/nginx/html:ro -p 8080:80 nginx
-- " function WebServerStop()
-- "   let id = system('docker ps --filter ancestor=nginx -q')
-- "   let cmd = system('docker stop ' . id)
-- " endfunction
-- " command! StopWebServer call WebServerStop()
-- "}
--
-- " https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
-- " https://bitbucket.org/Carpetsmoker/sanitize_files/src
-- " function TrimWhiteSpace()
-- "     let l:save_cursor = getpos('.')
-- "     %s/\s\+$//e
-- "     call setpos('.', l:save_cursor)
-- " endfunction
-- " command! WhiteSpaceRemove :call TrimWhiteSpace()
-- " 2020-06-17 15:44:16 replaced with ale '*': ['remove_trailing_lines', 'trim_whitespace']
--
-- " Use jq instead
-- " http://dustinmartin.net/format-json-in-vim/
-- " command! FormatJSON %!python3 -m json.tool
--
-- ]])
-- Plugins

-- vim.cmd([[
--
-- " https://github.com/junegunn/fzf {
-- if isdirectory(expand('~/.fzf'))
--   set runtimepath^=~/.fzf
-- endif
-- " }
--
-- ]])

-- if vim.fn.isdirectory(vim.fn.expand("$HOME/.fzf")) then
--   vim.opt.runtimepath:append(vim.fn.expand("$HOME/.fzf"))
-- end

-- Code navigation shortcuts
-- as found in :help lsp
-- This line below breaks the help file navigation
-- nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
-- vim.cmd([[
-- nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
-- nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
-- nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
-- nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
-- nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
-- nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
-- nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
-- nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
-- ]])

-- Quick-fix
-- vim.cmd([[
-- nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
-- ]])

-- Limelight let g:limelight_conceal_ctermfg = 'darkgray'
vim.g.limelight_conceal_ctermfg = 237

vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"

-- Setup Completion
-- https://neovim.io/doc/user/lsp.html#lsp-completion
-- native completion configured in lsp/pyright.lua
-- 2025-07-14 21:10:49

-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
--[[
  completion = {
    autocomplete = false, -- disable auto-completion, use tab instead ? doesn't show docs?
  },
--]]
local cmp = require("cmp")
cmp.setup({
  --	snippet = {
  --		expand = function(args)
  --			vim.fn["vsnip#anonymous"](args.body)
  --		end,
  --	},
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
-- this line requires a bashls.lua in .config/nvim/lsp
vim.lsp.enable({
  "bashls",
  "luals",
  "ruff",
  "pyright",
  --	"pyrefly",
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

-- 2024-02-10 08:12:34 highly experimental zx should fix folding issues
vim.opt.foldminlines = 4
-- vim.opt.foldnestmax
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.termguicolors = true
vim.cmd.colorscheme("solarized_lua")

-- Set leader keys (must be set before any keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
  -- 	RGB      = true;         -- #RGB hex codes
  -- 	RRGGBB   = true;         -- #RRGGBB hex codes
  -- 	names    = true;         -- "Name" codes like Blue
  -- 	RRGGBBAA = false;        -- #RRGGBBAA hex codes
  -- 	rgb_fn   = false;        -- CSS rgb() and rgba() functions
  -- 	hsl_fn   = false;        -- CSS hsl() and hsla() functions
  -- 	css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  -- 	css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- 	-- Available modes: foreground, background
  -- 	mode     = 'background'; -- Set the display mode.
  --   }
  { "*" },
  { mode = "foreground" }
)

-- Load telescope setup first
require("plugins.telescope")
-- Then load keymaps (requires telescope to be setup)
require("plugins.telescope_keys")

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
