set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/a.vim'
Plugin 'bling/vim-airline'
Plugin 'w0ng/vim-hybrid'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin indent on     " required!

set t_Co=256
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" tagbar
"map <C-m> :TagbarToggle<CR>

" NERDTREE
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

nmap <C-b> :r !xclip -o<CR>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" syntastic
let g:syntastic_ignore_files=['tex']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" neocomplete
let g:neocomplete#enable_at_startup = 1

" GENERAL
set tabstop=4       " 4 spaces
set shiftwidth=4    " 4 spaces
set softtabstop=4   " 4 spaces
set expandtab       " use spaces
set number          " show line numbers
set nowrap          " dont wrap lines
set laststatus=2    " used to draw airline at start
set cursorline      " highlight current line
set showmatch       " highlight matching [{()}]

let defaultmake="g++ -std=c++0x -g -Wall -Wextra -O2 -o %:r %"
let cmake="make --directory=build"

nmap m :nohlsearch<CR>
nmap <c-n> :NERDTreeToggle<CR>
nmap <F8> :w <CR> :let &makeprg = cmake       <CR> :make <CR>
nmap <F7> :w <CR> :let &makeprg = defaultmake <CR> :make <CR>
nmap <F5> :!./%:r <CR>

nmap <C-X> :w <CR> :let &makeprg = defaultmake <CR> :make <CR> :!./%:r <CR>


nmap <F10> :cprevious <CR>
nmap <F12> :cnext <CR>

set splitright

set autoindent
syntax on
filetype indent on
set showcmd
set incsearch

set mouse=a
"set colorcolumn=80

autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufNewFile,BufReadPost *.cs setl shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

autocmd BufNewFile,BufReadPost *.yaml setl foldmethod=indent
autocmd BufRead,BufNewFile   *.tex,*.md,*.java setl wrap


set cino=N-s

hi Comment ctermfg=8

" clang format
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
