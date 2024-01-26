vim.opt.runtimepath:prepend(vim.env.HOME .. '/.vim')
-- not currently using the /after directory
-- vim.opt.runtimepath:append(HOME .. '/.vim/after')

-- statusline does not show powerline symbols when this is removed
vim.cmd('source ~/.vim/vimrc')

vim.opt.packpath = vim.opt.runtimepath:get()

vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme solarized8')
vim.opt.background = 'dark'
vim.opt.termguicolors = true

-- vim.inspect prints tables on startup
-- print(vim.inspect(vim.opt.packpath))
-- print(vim.inspect(vim.opt.runtimepath))

--[[ Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
--]]

-- Avoid showing extra messages when using completion
-- vim.cmd('set shortmess+=c')
vim.opt.shortmess:append('c')

-- TODO move to file type loading
-- Adds extra functionality over rust analyzer
vim.cmd('packadd rust-tools.nvim')


vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- https://github.com/sharksforarms/neovim-rust/blob/master/neovim-init-lsp-cmp-rust-tools.vim
--[[" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
--]]

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local opts = {
    tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        -- TODO: replace with keybinding in on_attach -> hover_with_actions = true,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

vim.opt.omnifunc='v:lua.vim.lsp.omnifunc'

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
--[[
  completion = {
    autocomplete = false, -- disable auto-completion, use tab instead ? doesn't show docs?
  },
--]]
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
-- Set up lspconfig.
--   local capabilities = require('cmp_nvim_lsp').default_capabilities()
--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--   require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
--   }

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


-- for Terminal windows  (double square brackets do not require extra escaping)
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true})
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true})
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true})
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true})
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true})


-- Limelight let g:limelight_conceal_ctermfg = 'darkgray'
vim.g.limelight_conceal_ctermfg = 237

-- TODO: tested, working with basic functionality
require'lspconfig'.tsserver.setup{}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "python", "javascript", "go", "rust", "cpp", "sql", "c",  "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {  },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
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
}
