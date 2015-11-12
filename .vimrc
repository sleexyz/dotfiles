call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'jimmay5469/vim-spacemacs'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'JuliaLang/julia-vim'
Plug 'tpope/vim-markdown'
Plug 'othree/html5.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'cespare/vim-toml'
Plug 'lambdatoast/elm.vim'
Plug 'christoomey/vim-tmux-navigator'

"ctrl-p
Plug 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


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
set mouse=
set hidden
syntax on
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
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


"Filetypes
"autocmd FileType conf :set ft=markdown
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
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

nore ; :
imap jk <esc>
imap q: :q
" command W w !sudo tee % > /dev/null

"Mycorrhizome
nmap <F3> dd:echo system('str="$(date +"%F %H:%M")";str="$str$(echo '.shellescape(@").')";str=(${str:0:-1});echo $str>> $HOME/text/done')<CR>:echo 'Nice Job!'<CR>
imap <F6> <esc>:r!echodate<CR>A
nmap <F7> <esc>:r!t --now <CR>A  -  <esc>0i<backspace><esc>A
" autocmd BufEnter thoughts.md normal G
autocmd BufEnter thoughts.md set ft=markdown
autocmd BufEnter s set ft=markdown


call plug#end()
