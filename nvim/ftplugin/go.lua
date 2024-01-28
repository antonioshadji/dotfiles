vim.cmd([[
packadd vim-go

"   must also run (within vim) :GoUpdateBinaries
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
]])
