" modeline {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
" initial setup taken from SPF13
" https://github.com/spf13/spf13-vim
" }

" Note:
" To insert list of keymaps into buffer
" :redir @a
" :map, imap, nmap, vmap, lmap
" "ap
" :help map to see more info

" Set to ward off unexpected things, and sanely reset options when re-sourcing .vimrc
set nocompatible

" Source bundles config {
  if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
  endif
" }

" General Settings {
set encoding=utf-8      " show buffer as utf-8 https://github.com/square/maximum-awesome (**MUST BE EARLY IN FILE**)
scriptencoding utf-8
set mouse=a             " Automatically enable mouse usage
set mousehide           " Hide the mouse cursor while typing
set viewoptions=folds,options,cursor,unix,slash "see :help viewoptions
set virtualedit=onemore " Allow for cursor beyond last character
set history=10000       " command history length extra long
set hidden              " Allow buffer switching without saving
set autochdir           " Always change to current file directory
set autowriteall        " Write files when many actions, including switching buffers see :help awa
set autoread            " auto re-load files when changed on disk https://github.com/square/maximum-awesome
"}

" Setup clipboard to work with desktop copy / paste {
" https://stackoverflow.com/questions/2842078/how-do-i-detect-os-x-in-my-vimrc-file-so-certain-configurations-will-only-appl
" works with modern mac osx El Capitan and Ubuntu 12.04 or later
if system("uname") == "Linux\n"       " has ('x') && has ('gui')  On Linux use + register for copy-paste
  set clipboard=unnamedplus
elseif system("uname") == "Darwin\n"  "has ('gui') On Mac & Win use * register for copy-paste
    set clipboard=unnamed
endif
" this should work for nvim on linux based on this
" https://neovim.io/doc/user/nvim_clipboard.html#nvim-clipboard
" }

" Vim UI {
set cursorline                  " Highlight current line
set backspace=indent,eol,start  " fix backspace
set number                      " show line numbers
set showmatch                   " jump cursor to matching brace when entered
set showcmd
set incsearch                   " search as you type
set hlsearch                    " highlight search terms :noh to clear
set ignorecase                  " case-insensitive search
set smartcase                   " use case sensitive search if any caps present
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set wildmenu                    " Show list instead of just completing
" https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=5                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
"  To insert special character - in insert mode CTRL-K two character code from :digraphs command
set listchars=tab:›\ ,trail:∙,extends:≫,precedes:≪,nbsp:†   " Highlight problematic whitespace
set list
"} end Vim UI

" Formatting {
set nowrap              " do not wrap long lines, show indicator instead
set autoindent          " always autoindent
set shiftwidth=2        " number of spaces to use for autoindent
set expandtab           " expands tabs to spaces
set tabstop=2           " actual tabs occupy 4 spaces
set softtabstop=2       " insert mode tab and backspace
set splitright          " puts new vsplit windows to the right
set splitbelow          " puts new hsplit windows below current
set pastetoggle=<F12>   " sane indentation on pastes
set printoptions=formfeed:y  "insert Ctrl-V Ctrl-L (^L) to create print pagebreak

" }

" GUI Settings (here instead of .gvimrc) {
if has('gui_running')
  " vim-airline requires patched fonts from Powerline for GUI
  " Set my preferred font with comma separated list(spaces must be escaped)
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
  set guioptions-=T               "Remove tool bar
  set guioptions+=c               "Use console dialogs
  set lines=48                    "Larger window than 24 row terminal
  set columns=85                  "Wider to accomodate gutter plugins
  "http://stackoverflow.com/questions/18752175/gvim-makes-altletter-key-produce-an-accented-character-instead-of-exiting-ins
  "set guioptions -=m
  "inoremap <M-l> <Esc>l
  "inoremap <M-j> <Esc>j
  "inoremap <M-k> <Esc>k
  "inoremap <M-h> <Esc>h
endif
"} end GUI settings

" Backup and undo settings {
if has('persistent_undo')
    set undofile
    set undolevels=1000
    " no undo files left in CWD
    if !isdirectory(expand("~/.vim/undo/"))
      " help mkdir for more information on use
      call mkdir(expand("~/.vim/undo/"), "p")
      "!mkdir -p ~/.vim/undo/
    endif
    set undodir=~/.vim/undo//
endif
set backup                  "See :help backup
" no backup files left in CWD
if !isdirectory(expand("~/.vim/backup/"))
  call mkdir(expand("~/.vim/backup/"), "p")
  "!mkdir -p ~/.vim/backup/
endif
set backupdir=~/.vim/backup//
" no swap files left in CWD
if !isdirectory(expand("~/.vim/swap/"))
  call mkdir(expand("~/.vim/swap/"), "p")
  "!mkdir -p ~/.vim/swap/
endif
set directory=~/.vim/swap//
" undodir set from spf13
"}

"Keyboard Shortcuts {
" When you have a problem about vim mappings.
" Check :verbose inoremap at the first.
" If you know the keys which have problem,
" then do it with specified key, for example :verbose inoremap <esc>.

" http://vim.wikia.com/wiki/Avoid_the_escape_key
" <C-c> is an alternative to Esc but does not run autocmd by default
imap <C-c> <Esc>
" these keys are mapped in YouCompleteMe so are now disabeled until I update
imap <Up> <Esc><Up>
imap <Down> <Esc><Down>

" http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
" default mapleader is \
let mapleader = "-"
let localmapleader = "\\"

"http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q q

" http://nvie.com/posts/how-i-boosted-my-vim/
" The following trick is a really small one, but a super-efficient one,
" since it strips off two full keystrokes from almost every Vim command:
nnoremap ; :

"force myself to use hjkl instead of arrow keys <nop> only normal mode
" jk <down><up> hl<left><right>
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-left> <C-w>h
map <C-down> <C-w>j
map <C-up> <C-w>k
map <C-right> <C-w>l

" Allow saving of files as sudo when I forgot to start vim using sudo.
" https://github.com/square/maximum-awesome/blob/master/vimrc
" cnoremap w!! %!sudo tee > /dev/null %
" http://www.geekyboy.com/archives/629
cnoremap w!! :w !sudo tee %


"https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
" Toggle 'keep current line in the center of the screen' mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

"} end keyboard shortcuts

" Auto Commands: {
if !exists("g:autocommands_loaded")
  let g:autocommands_loaded = 1

" Git autocmd {
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"}

" http://vim.wikia.com/wiki/Shebang_line_automatically_generated {
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.js 0put =\"#!/usr/bin/env node\<nl># -*- coding: utf-8 -*-\<nl>\"|$
augroup END
" }

" Update Last Modified line when editing pandoc {
" If buffer modified, update any 'Last modified: ' in the first 20 lines 
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime('%a %b %d, %Y  %I:%M%p  ') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfunction
autocmd BufWritePre,FileWritePre *.md :call LastModified()
"}

" md is markdown > use pandoc filetype {
autocmd BufRead,BufNewFile *.md set filetype=pandoc
" Enable spellchecking for Markdown
autocmd FileType pandoc setlocal spell
" }

"http://ku1ik.com/2011/09/08/formatting-xml-in-vim-with-indent-command.html {
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -
"}

" write file when leaving insert mode if changes have been made {
" http://www.reddit.com/r/vim/comments/232j45/save_file_on_insert_mode_exit/
autocmd InsertLeave * :silent! update
"}

" save on FocusLost {
" https://github.com/mscoutermarsh/dotfiles/blob/master/vimrc
autocmd FocusLost * :silent! wa
" }
endif
" end Auto Commands: }

" source configuration for plugins last {
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif
"}

" Neovim settings to make vim work just like Neovim {
" https://neovim.io/doc/user/options.html#'complete'
set formatoptions+=tcqj     " https://neovim.io/doc/user/options.html#'formatoptions'
set langnoremap             " https://neovim.io/doc/user/options.html#'langnoremap'
set laststatus=2            " https://neovim.io/doc/user/options.html#'laststatus'
set nrformats=hex           " https://neovim.io/doc/user/options.html#'nrformats'
" https://neovim.io/doc/user/options.html#'sessionoptions'
set sessionoptions+=blank,buffers,curdir,folds,help,tabpages,winsize
set smarttab                " https://neovim.io/doc/user/options.html#'smarttab'
" 50 vs 10 for https://neovim.io/doc/user/options.html#'tabpagemax'
set tags+=./tags;,tags      " https://neovim.io/doc/user/options.html#'tags'
"}
