" Personal .vimrc file of Jan-Willem Buurlage <janwillembuurlage@gmail.com>

" PLUGINS
" =======

" initialize plugin manager
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/a.vim'
Plug 'w0ng/vim-hybrid'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" finalize vundle
call plug#end()

" allow plugins to handle filetype indentation
filetype plugin indent on

" COLOR SCHEME
" ============

syntax on            " use syntax higlighting
set t_Co=256         " use 256 colors
set background=dark  " use dark background

" EDITOR
" ======

set tabstop=4        " 4 spaces
set shiftwidth=4     " 4 spaces
set softtabstop=4    " 4 spaces
set expandtab        " use spaces
set number           " show line numbers
set nowrap           " dont wrap lines

set cursorline       " highlight current line
set showmatch        " highlight matching [{()}]
set autoindent       " automatically indent blocks
set showcmd          " show information on current cmd
set incsearch        " show results while searching
set scrolloff=1      " always show at least one line above/below cursor

" IDE SHORTCUTS
" =============

" clang format
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" LANGUAGE SPECIFIC
" =================

" wrap/fold certain files
autocmd BufNewFile,BufReadPost *.yaml setl foldmethod=indent
autocmd BufRead,BufNewFile   *.tex,*.md,*.java setl wrap

" do not indent C++ namespaces
set cino=N-s

" PLUGIN SETTINGS
" ===============

" NERD Tree
" ---------

" show NT on startup if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif

" set toggle shortkey
map <C-n> :NERDTreeToggle<CR>

" automatically close if NT is only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" custom character map for NT git status
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" A.vim
" -----

" set show alternative shortkey
map <C-a> :A<CR>

" Hybrid color scheme
" -------------------

let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" Tagbar
" ------

" set show tagbar shortkey
map <C-m> :TagbarToggle<CR>

" Airline
" -------

" draw airline at start
set laststatus=2
