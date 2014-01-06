set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on     " required!

" NERDTREE
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" GENERAL
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu

" CONTEST COMPILES
map <F7> :w <ENTER> :!g++ -Wall -O2 -g -o %:r % <ENTER>
map <F5> <F7> <ENTER> :!./%:r <ENTER>
map <F4> <F7> <ENTER> :!./%:r < %:r.in > %:r.myout <ENTER>
map <F3> <F4> <ENTER> :!diff %:r.myout %:r.out <ENTER>

set autoindent
syntax on
set showcmd
set incsearch

set mouse=a
