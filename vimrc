" Personal .vimrc file of Jan-Willem Buurlage <janwillembuurlage@gmail.com>

" PLUGINS
" =======

" initialize plugin manager
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/a.vim'
Plug 'w0ng/vim-hybrid'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

" A.vim
" -----

" set show alternative shortkey
" map <C-Tab> :A<CR>

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

" YouCompleteMe
" -------------

let g:ycm_confirm_extra_conf = 0

" VimMarkdown
" -----------

let g:vim_markdown_folding_disabled = 1

" Snippets
" --------

let g:UltiSnipsEditSplit="vertical"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.snippets']
