vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
]])

vim.cmd('packadd nvim-lspconfig')
-- TODO move to file type loading
vim.cmd('packadd rust-tools.nvim')
require('rust-tools').setup({})

vim.cmd([[
set omnifunc=v:lua.vim.lsp.omnifunc
]])
