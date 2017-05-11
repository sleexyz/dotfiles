call plug#begin('~/.config/nvim/plugged')

" Spacemacs bindings
Plug 'sleep/vim-spacemacs'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'dbakker/vim-projectroot'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
Plug 'szw/vim-maximizer'

" Language Support
Plug 'LnL7/vim-nix'
Plug 'JuliaLang/julia-vim'
Plug 'tpope/vim-markdown'
Plug 'othree/html5.vim'
Plug 'cespare/vim-toml'
Plug 'lambdatoast/elm.vim'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'raichoo/purescript-vim'
Plug 'idris-hackers/idris-vim'
Plug 'kchmck/vim-coffee-script'


" Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'



"snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
imap <C-J> <Plug>snipMateNextOrTrigger

"Appearance
Plug 'itchyny/lightline.vim'
let g:minimap_highlight='Visual'
highlight LineNr ctermfg=black
highlight CursorLineNr ctermfg=black
set nohlsearch
set relativenumber

"minimalism
Plug 'junegunn/goyo.vim'
Plug 'sleep/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7


"General
set mouse=a
set hidden
syntax on
set backupdir=~/.config/nvim/tmp,.
set directory=~/.config/nvim/tmp,.
set autoindent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set showmatch
set matchtime=5
set laststatus=2
set showcmd
set ignorecase
set smartcase
set incsearch
set splitbelow
set splitright
set backspace=indent,eol,start 
" au BufEnter,BufNewFile,BufRead * setlocal fo-=c fo-=r fo-=o "disable default autocommenting behavior


"Filetypes
"autocmd FileType conf :set ft=markdown
au BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
au BufNewFile,BufRead *.md set filetype=markdown

"wildmenu
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

"Bindings
let mapleader = "\<SPACE>"
let maplocalleader = "\<SPACE>m"
" nore ; :
imap jk <esc>
" imap q: :q
command W w
command Wq wq
command Wsudo w !sudo tee % > /dev/null




"Mycorrhizome
nmap <F3> dd:echo system('str="$(date +"%F %H:%M")";str="$str$(echo '.shellescape(@").')";str=(${str:0:-1});echo $str>> $HOME/text/done')<CR>:echo 'Nice Job!'<CR>
imap <F6> <esc>:r!echodate<CR>A
nmap <F7> <esc>:r!t --now <CR>A  -  <esc>0i<backspace><esc>A
" auto BufEnter thoughts.md normal G
au BufEnter thoughts.md set ft=markdown
au BufEnter s set ft=markdown


call plug#end()
