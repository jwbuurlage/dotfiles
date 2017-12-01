syntax on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-sensible'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust'
Plug 'tweekmonster/deoplete-clang2'
Plug 'sbdchd/neoformat'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'ervandew/supertab'
Plug 'eagletmt/neco-ghc'
Plug 'neomake/neomake'
call plug#end()

set nocompatible
set number
set nowrap
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set mouse=a
set history=1000
set cursorline

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

" 256 colors
set t_Co=256
set background=dark  " use dark background

" Hybrid color scheme
let base16colorspace=256
colorscheme base16-default-dark

"" > Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_mode_map = { 'mode': 'passive' }
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"" let g:syntastic_check_on_open = 1
"" let g:syntastic_check_on_wq = 1
"
"let g:syntastic_rust_checkers = ['cargo']

" > Deoplete
au FileType rust compiler cargo
let g:deoplete#enable_at_startup = 1

" > Racer
let g:deoplete#sources#rust#racer_binary='/home/jw/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/jw/code/rust/src/'
let g:deoplete#sources#rust#show_duplicates=1

map <C-f> :Neoformat<CR>

" > NERDtree

map <C-n> :NERDTreeToggle<CR>

" > Airline

set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 0

" > FZF
"
map <C-p> :FZF<CR>

" > Haskell
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" > Clang

let g:deoplete#sources#clang#executable = '/usr/bin/clang'

" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)
