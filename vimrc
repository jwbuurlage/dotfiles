" Personal .vimrc file of Jan-Willem Buurlage <janwillembuurlage@gmail.com>

" PLUGINS
" =======

" initialize plugin manager
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kana/vim-altr'
Plug 'w0ng/vim-hybrid'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Rip-Rip/clang_complete', { 'do': 'make install' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'

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
set relativenumber   " show relative line numbers
set nowrap           " dont wrap lines

set cursorline       " highlight current line
set showmatch        " highlight matching [{()}]
set autoindent       " automatically indent blocks
set showcmd          " show information on current cmd
set incsearch        " show results while searching
set scrolloff=1      " always show at least one line above/below cursor
set sidescroll=1     " reveal 1 char at a time when scrolling horizontally

" IDE SHORTCUTS
" =============

" clang format
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" compile and run
map <F7> :!g++ -std=c++14 % -o %:r && ./%:r<cr>

" LANGUAGE SPECIFIC
" =================

" wrap/fold certain files
autocmd BufNewFile,BufReadPost *.yaml setl foldmethod=indent
autocmd BufRead,BufNewFile   *.tex setl wrap

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

" altr
" -----

command! A call altr#forward()
call altr#define('include/%.hpp', 'src/%.cpp')

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
let g:airline_powerline_fonts = 1

" VimMarkdown
" -----------

let g:vim_markdown_folding_disabled = 1

" ClangComplete
" -------------

let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_auto_select = 1
let g:clang_close_preview = 1
let g:clang_library_path = '/usr/lib/'
let g:clang_user_options = '|| exit 0'

" Snippets
" --------

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.snippets']
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
