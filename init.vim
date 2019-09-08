call plug#begin('~/.vim/plugged')


Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdTree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomasr/molokai'
Plug 'eugen0329/vim-esearch'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'philip-karlsson/aerojump.nvim', { 'do' : ':UpdateRemotePlugins'}



call plug#end()
let g:deoplete#enable_at_startup = 1

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
nmap <C-o> :NERDTreeToggle<CR>


set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Section General
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set history length
set history=1000

"enable filetype plugin
filetype plugin on
filetype indent on

"set auto reload file when file changes externally"
set autoread
"
"set map leader"
let mapleader=","

"set encoding
set encoding=utf8
set ffs=unix,dos,mac

"do not create a backup
set nobackup

"do not create swapfile
set noswapfile

"nowb
set nowb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Section User Interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set lines to the cursor when moving vertically"
set so=0

"turn on wild menu"
set wildmenu

"show current position"
set ruler

"set command line height"
set cmdheight=2

"set hid"
set hid

"ignore case in search mode"
set ignorecase

"highlight search results"
set hlsearch

"show matching braces"
set showmatch
set mat=10


"set extra marigin to left"
set foldcolumn=0


"enable line number"
set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Section Colors and Fonts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"eanble syntax highlighting"
syntax enable

let g:airline_theme="badwolf"
colorscheme molokai
let g:molokai_orginal=1
set t_Co=256


"set color for cursorline
hi Cursorline cterm=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermbg=234
set cursorline
set cursorcolumn

"set color for matching braces
hi MatchParen cterm=bold ctermbg=0 ctermfg=201

"highlight cursor
highlight Cursor guifg=red guibg=black
"
"highlight visual selection
hi Visual     cterm=bold ctermfg=15  ctermbg=13  

"git diff highlight
highlight DiffDelete cterm=none ctermfg=fg ctermbg=90 gui=none guifg=fg guibg=Purple
highlight DiffAdd cterm=none ctermfg=fg ctermbg=19 gui=none guifg=fg guibg=Blue
"highlight DiffChange cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
highlight DiffText cterm=none ctermfg=bg ctermbg=178 gui=none guifg=bg guibg=White

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Section Text, Tab, Spaces
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"use tabs
set expandtab

"use smart tabs
set smarttab

"one tab is four spaces
set shiftwidth=4
set tabstop=4

"configure linebreak
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Section User Defined Remapping
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"disable search highlight
map <leader><cr> :noh<cr>
"quick shutdown vim
nmap <F4> <ESC>:q<CR>
imap <F4> <ESC>:q<CR>
nmap <leader>q :q<CR>
"quick shutdown vim and don't save changes
noremap <leader><F4> <ESC>:qall!<CR>
"quick save file 
nmap <F5> <ESC>:w<CR>
imap <F5> <ESC>:w<CR>
"open nertree 
nmap <C-o> :NERDTree<CR>
"enable visual block mode for non linux systems
noremap <C-S-V> <C-V>
"jump to sign
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
"jump to line
nmap <leader><leader>w <Plug>(easymotion-overwin-line)
"search
nmap / <Plug>(easymotion-sn)
"search
omap / <Plug>(easymotion-tn)
"move to right split window
map <C-l> <C-W>l
"move to left split window
map <C-h> <C-W>h
"move to upper split window
map <C-k> <C-W>k
"move to lower split window
map <C-j> <C-W>j
"remap ESC in visual mode
inoremap <C-l> <ESC>
"remap ESC in visual mode
vnoremap <C-l> <ESC>                 

"create new tab
noremap <S-t> :tabnew<CR>
"move to previous tab
noremap <S-h> :tabprevious<CR>
"move to next tab
noremap <S-l> :tabnext<CR>
"create new vertical split
noremap <leader>s :vsplit<CR>
"jump over bracket
inoremap <C-E> <C-o>A
"jump to ctag reference
nnoremap <leader>a <C-]>
"jump back from ctag reference
nnoremap <leader><leader>a <C-t>
"Aerojump Mode Space
nmap <leader>as <Plug>(AerojumpSpace)
"Aerojump Mode Bolt
nmap <leader>ab <Plug>(AerojumpBolt)
"Aerojump Mode Default
nmap <leader>ad <Plug>(AerojumpDefault)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Section Status Line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! CleanExtraSpaces()           
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e        
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun    

if has("autocmd")
    autocmd BufWritePre *.c,*.cpp,*.groovy,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif



