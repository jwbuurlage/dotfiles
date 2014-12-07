set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'kchmck/vim-coffee-script'
Bundle 'w0ng/vim-hybrid'
 

filetype plugin indent on     " required!

set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" NERDTREE
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

nmap <C-b> :r !xclip -o<CR>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" syntastic
let g:syntastic_ignore_files=['tex']

" GENERAL
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu
set nowrap

let defaultmake="g++ -std=c++0x -g -Wall -Wextra -O2 -o %:r %"
let cmake="make --directory=build"

nmap m :nohlsearch<CR>
nmap <c-n> :NERDTreeToggle<CR>
nmap <F8> :w <CR> :let &makeprg = cmake       <CR> :make <CR>
nmap <F7> :w <CR> :let &makeprg = defaultmake <CR> :make <CR>
nmap <F5> <F7> <CR> :!./%:r <CR>

nmap <F10> :cprevious <CR>
nmap <F12> :cnext <CR>

set autoindent
syntax on
filetype indent on
set showcmd
set incsearch

set mouse=a
"set colorcolumn=80

autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
