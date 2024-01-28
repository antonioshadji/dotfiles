vim.cmd([[
packadd jedi-vim

let g:jedi#smart_auto_mappings = 1
let g:jedi#show_call_signatures_delay = 200
let g:jedi#use_splits_not_buffers = 'right'
let g:jedi#goto_command = 'gd'

]])
