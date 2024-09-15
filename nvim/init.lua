-- good example init files
-- https://github.com/potamides/dotfiles

-- remove dependence on vim plugins 2024-03-26 13:26:40
-- vim.opt.runtimepath:prepend(vim.env.HOME .. "/.vim")
vim.opt.packpath = vim.opt.runtimepath:get()

-- spell file location inside ~/.config/nvim
vim.opt.spellfile = ("%s/spell/spf.%s.add"):format(vim.fn.stdpath("config"), vim.o.encoding)

-- add files to ignore
vim.opt.wildignore:append({ ".hg", ".git", ".svn" }) -- " Version control
vim.opt.wildignore:append({ "*.jpg", "*.bmp", "*.gif", "*.png", "*.jpeg" }) -- " binary images
vim.opt.wildignore:append({ "*.o", "*.obj", "*.exe", "*.dll", "*.manifest" }) -- " compiled object files
vim.opt.wildignore:append({ "*.spl" }) -- " compiled spelling word lists
vim.opt.wildignore:append({ "*.sw?" }) -- " Vim swap files
vim.opt.wildignore:append({ "*.DS_Store" }) -- " OSX bullshit
vim.opt.wildignore:append({ "*.luac" }) -- " Lua byte code
vim.opt.wildignore:append({ "*.pyc" }) -- " Python byte code
vim.opt.wildignore:append({ "*.class" }) -- " Java byte code

vim.opt.exrc = true -- Allow local vimrc files inside projects (for c/cpp)
vim.opt.secure = true -- do not allow autocmds in project specific vimrc
vim.opt.autowriteall = true -- Write files when many actions, including switching buffers see :help awa

vim.opt.clipboard = { "unnamed", "unnamedplus" }

vim.opt.cursorline = true -- Highlight current line
vim.opt.showmatch = true -- jump cursor to matching brace when entered
vim.opt.ignorecase = true -- case-insensitive search
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

--[[ Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
--]]

-- Avoid showing extra messages when using completion
-- vim.cmd('set shortmess+=c')
-- vim.opt.shortmess:append("c")

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.number = true
vim.opt.relativenumber = true

-- Code navigation shortcuts
-- as found in :help lsp
-- This line below breaks the help file navigation
-- nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
vim.cmd([[
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
]])

-- Quick-fix
vim.cmd([[
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
]])

vim.cmd([[
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
]])

-- Keyboard Shortcuts
vim.cmd([[
" help abbreviate
" Abbreviations:
iabbrev <expr> dts strftime('%F %T')

" Mappings:
" When you have a problem about vim mappings.
" Check :verbose inoremap at the first.
" If you know the keys which have problem,
" then do it with specified key, for example :verbose inoremap <esc>.

" http://vim.wikia.com/wiki/Avoid_the_escape_key
" ** alt + any key will exit insert mode and execute key action hl jk etc
" <C-c> is an alternative to Esc but does not run autocmd by default
" this mapping makes <C-c> execute Esc so autocmd runs
imap <C-c> <Esc>
" shift enter works in gvim, not in gnome-terminal
" enter ^M, s-enter ^M, c-enter <NL>
" https://stackoverflow.com/questions/598113/can-terminals-detect-shift-enter-or-control-enter
" imap <S-Enter> <Esc>
" CTRL_J will replace <CR> in insert mode
" imap <CR> <Esc><CR>

" leave insert mode when moving between lines
imap <Up> <Esc><Up>
imap <Down> <Esc><Down>

"http://www.bestofvim.com/tip/leave-ex-mode-good/
" <Nop> is no operation
map Q q

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" http://vimcasts.org/episodes/how-to-fold/
" use space bar in normal mode to toggle folds
" TODO: is there a better use for space bar?
nnoremap <Space> za
"
" This unsets the 'last search pattern' register by hitting return
" http://stackoverflow.com/a/662914/2472798
nnoremap <silent> <CR> :noh<CR>

" http://www.jovicailic.org/2015/05/saving-read-only-files-in-vim-sudo-trick/
" http://www.geekyboy.com/archives/629
" http://vim.wikia.com/wiki/Multiple_commands_at_once
cmap w!! w !sudo tee %
" vertical terminal
" cmap vt vert terminal
" terminal in new tab
" issues when using search replace
" cmap tt tab terminal

" compile and run java code for algs4
" https://docs.oracle.com/javase/8/docs/technotes/tools/windows/classpath.html
" -ea = enableassertions
" -cp = classpath
" map <F7> :!clear; javac -cp ../algs4.jar:. %<CR>
" map <F8> :!clear; java -ea -cp ../algs4.jar:. %:r<CR>

"from defaults.vim
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" workaround for netrw bug  :help netrw-debug
" https://github.com/vim/vim/issues/4738#issuecomment-521506447
" https://github.com/vim/vim/issues/4738#issuecomment-565330300
let g:netrw_nogx=1
" TODO: this only works on linux!!
nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>
" nnoremap <Leader>g :YcmCompleter GoTo<CR>
"
nmap <Leader>e :ALENextWrap<CR>
]])

-- for Terminal windows  (double square brackets do not require extra escaping)
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true })

-- Limelight let g:limelight_conceal_ctermfg = 'darkgray'
vim.g.limelight_conceal_ctermfg = 237

-- miscellaneous settings, do they need to exist?
vim.cmd([[
if trim(system('uname')) ==# 'Darwin'
  let g:python3_host_prog = '/usr/local/bin/python3'
else
  let g:python3_host_prog = '/usr/bin/python3'
endif
]])

-- Auto Commands
vim.cmd([[
if !exists('g:autocommands_loaded')
  let g:autocommands_loaded = 1

  augroup VIM
    au!
    " Close preview window when complete {
    " http://stackoverflow.com/a/26022965/2472798
    " autocmd CompleteDone * pclose
    " }
    " write file when leaving insert mode if changes have been made {
    " http://www.reddit.com/r/vim/comments/232j45/save_file_on_insert_mode_exit/
    " autocmd InsertLeave * :silent! update
    "}
    " save on FocusLost {
    " http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
    " no longer working on ubuntu 18.04
    " autocmd FocusLost * :wa
    " autocmd FocusLost * silent! wa
    " }

    " automatically resize windows on vim resize {
    " autocmd VimResized * :wincmd =
    "}
    "
    " jump to last known cursor position {
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " autocmd BufReadPost *
    "       \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    "       \   exe "normal! g`\"" |
    "       \ endif
    "}

    " set title bar to file location {
    " autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
    " }

  augroup END
  " Git autocmd {
  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  augroup GIT
    au!
    autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    " https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
    autocmd Filetype gitcommit setlocal spell textwidth=72
  augroup END
  "}

  " http://vim.wikia.com/wiki/Shebang_line_automatically_generated {
  augroup Shebang
    au!
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  augroup END
  " }

  " md is markdown > use pandoc filetype {
  augroup PANDOC
    au!
    " Enable spellchecking for Markdown
    autocmd FileType pandoc setlocal spell spelllang=en_us wrap linebreak
    autocmd FileType pandoc setlocal tabstop=4
    autocmd FileType pandoc setlocal shiftwidth=4
    autocmd FileType pandoc setlocal softtabstop=4
    autocmd FileType pandoc let b:ale_fix_on_save = 0
    " call local function to update line begining with last modified
    " autocmd BufWritePre *.md,*.markdown,*.mkd :call LastModified()
  augroup END
  " }

  " html template to start with {
  augroup HTML
    au!
    au BufNewFile *.html 0r ~/.vim/template/bootstrap.html
  augroup END
  " }

endif

" end Auto Commands: }
]])

-- Custom commands & functions
vim.cmd([[
" Update Last Modified line when editing pandoc {
" If buffer modified, update any 'modified: ' in the first 20 lines
" 'modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
" vim magic on by default - all lower case matches any case
" . concatenates without a space between
" getftime returns modified time of file name
" @% returns active buffer file name
function! LastModified()
  " comment out &modified if using getftime()
  "  if &modified
  let save_cursor = getpos('.')
  " minimum of 20 lines or file length
  let n = min([20, line('$')])
  " requires space after modified:
  keepjump execute '1,' . n . 's#^\(.\{,10}modified: \).*#\1' .
        \ strftime('%c') . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
  echom 'updated last modified date'
  "  endif
endfunction
"}
" Searching with RipGrep {
" https://robots.thoughtbot.com/faster-grepping-in-vim#override-to-use-the-silver-searcher
" https://github.com/ggreer/the_silver_searcher
if executable('rg')
  " use rg instead of silver searcher
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat="%f:%l:%c:%m"
endif
"}
" Start/Stop nginx webserver in current pwd {
" https://hub.docker.com/_/nginx/
command! StartWebServer !docker run -d --name $(basename $(pwd)) -v $(pwd):/usr/share/nginx/html:ro -p 8080:80 nginx
function WebServerStop()
  let id = system('docker ps --filter ancestor=nginx -q')
  let cmd = system('docker stop ' . id)
endfunction
command! StopWebServer call WebServerStop()
"}

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
" https://bitbucket.org/Carpetsmoker/sanitize_files/src
" function TrimWhiteSpace()
"     let l:save_cursor = getpos('.')
"     %s/\s\+$//e
"     call setpos('.', l:save_cursor)
" endfunction
" command! WhiteSpaceRemove :call TrimWhiteSpace()
" 2020-06-17 15:44:16 replaced with ale '*': ['remove_trailing_lines', 'trim_whitespace']

" http://dustinmartin.net/format-json-in-vim/
command! FormatJSON %!python3 -m json.tool

]])
-- Plugins
vim.cmd([[
" must run this command when new plugins installed or no help available
helptags ALL

" git@github.com:w0rp/ale.git {

" https://github.com/w0rp/ale#2ii-fixing
" check help ale-options for defaut settings and options available

" turn ale off for specific file
" let g:ale_pattern_options = {'.*openapi\.json$': {'ale_enabled': 0}}
" let g:ale_enabled = 0

" Use the global executables
let g:ale_use_global_executables = 1
let g:ale_linters = {
  \ 'python': ['ruff'],
  \ 'javascript': ['eslint'],
  \ 'c': ['clang'],
  \ 'cpp': ['clang'],
  \ 'json': ['jq'],
  \ 'rust': ['rust-analyzer'],
  \ 'lua': ['luacheck'],
  \}

let g:ale_fixers = {
  \ 'python': ['isort', 'ruff_format'],
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'javascript': ['prettier'],
  \ 'yaml': ['yamlfix'],
  \ 'json': ['jq'],
  \ 'rust': ['rustfmt'],
  \ 'lua' : ['stylua'],
  \ '*': ['trim_whitespace','remove_trailing_lines']
  \}
let g:ale_fix_on_save = 1

let g:ale_python_isort_options = '--use-parentheses'

let g:ale_echo_msg_format = '%linter%[%code%]: %s'
" https://clang.llvm.org/docs/UsersManual.html#command-line-options
let g:all_c_clang_options = '-Wall -std=c11'
let g:ale_c_clangd_options = '-Wall -std=c11'

" change format options.  I want to train myself to prefer Google style code
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: Google}"'
" disable ale for python use ruff-lsp
" let g:ale_pattern_options = {'\.py$': {'ale_enabled': 0}}
" }

" Status line https://github.com/vim-airline/vim-airline {
  " do not show error/warning colors when no errors/warnings
  let g:airline_skip_empty_sections = 1
  " overide default section z https://github.com/vim-airline/vim-airline/issues/272
  let g:airline_section_z = '%p%%'. " \ue0a1". '%l:%v'
  " choose custom theme in .vim/autoload/airline/themes/
  let g:airline_theme='powerline'
  " Fancy arrow symbols, requires a patched font
  let g:airline_powerline_fonts = 1
  " Show PASTE if in paste mode
  let g:airline_detect_paste=1
  " Don't take up extra space with +/-/~ of 0
  let g:airline#extensions#hunks#non_zero_only = 1
  " Limit wordcount to where it makes sense
  let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|pandoc|rst|org'
  " Fancy stuff in tabline as well
  " let g:airline#extensions#tabline#enabled = 1

  let g:airline_disable_statusline = 1
" }

" https://github.com/junegunn/fzf {
if isdirectory(expand('~/.fzf'))
  set runtimepath^=~/.fzf
endif
" }

]])

vim.cmd([[
if filereadable('Session.vim')
  :silent source Session.vim
endif
]])

-- nvim_lsp object
local nvim_lsp = require("lspconfig")

vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
--[[
  completion = {
    autocomplete = false, -- disable auto-completion, use tab instead ? doesn't show docs?
  },
--]]
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
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
		{ name = "vsnip" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set up lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--   require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
--   }

-- require("lspconfig").jedi_language_server.setup({
-- 	capabilities = capabilities,
-- })
-- require("lspconfig").pylsp.setup({
-- 	capabilities = capabilities,
-- })
require("lspconfig").pyright.setup({
	capabilities = capabilities,
})
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})

-- this works for go only
-- maybe use this plugin for others? https://github.com/lukas-reineke/lsp-format.nvim
require("go").setup({
	lsp_cfg = {
		capabilities = capabilities,
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").gofmt()
	end,
	group = vim.api.nvim_create_augroup("GoFormat", {}),
})

require("lspconfig").gopls.setup({
	capabilities = capabilities,
	settings = {
		gopls = {
			semanticTokens = true,
		},
	},
})

-- require("lspconfig").rust_analyzer.setup({
-- 	capabilities = capabilities,
-- })

require("lspconfig").clangd.setup({
	capabilities = capabilities,
})


require('lspconfig').lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"c",
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
		"lua",
		"make",
		"markdown",
		"python",
		"query",
		"rust",
		"sql",
		"toml",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
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
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
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
vim.opt.foldlevel=99

require("neogit").setup({})

vim.opt.termguicolors = true
vim.cmd.colorscheme("solarized_lua")

-- script to reset cursor to last position on last save
require("lastplace")

require("lualine").setup({ options = { theme = "powerline" } })

require("nvim-tmux-navigation").setup({
	disable_when_zoomed = true, -- defaults to false
})

require("lspconfig").ruff_lsp.setup({})


