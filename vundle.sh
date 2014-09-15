#!/usr/bin/env bash
# -*- coding: utf-8 -*-
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
#" Setting up Vundle - the vim plugin bundler
#    let iCanHazVundle=1
#    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
#    if !filereadable(vundle_readme)
#        echo "Installing Vundle.."
#        echo ""
#        silent !mkdir -p ~/.vim/bundle
#        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
#        let iCanHazVundle=0
#    endif
#    set rtp+=~/.vim/bundle/vundle/
#    call vundle#rc()
#    Bundle 'gmarik/vundle'
#    "Add your bundles here
#    Bundle 'Syntastic' "uber awesome syntax and errors highlighter
#    Bundle 'altercation/vim-colors-solarized' "T-H-E colorscheme
#    Bundle 'https://github.com/tpope/vim-fugitive' "So awesome, it should be illegal 
#    "...All your other bundles...
#    if iCanHazVundle == 0
#        echo "Installing Bundles, please ignore key map error messages"
#        echo ""
#        :BundleInstall
#    endif
#" Setting up Vundle - the vim plugin bundler end
