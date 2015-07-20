"Vundle Setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'tpope/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'cespare/vim-toml'
Plugin 'lambdatoast/elm.vim'

"ctrl-p
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
imap <C-J> <Plug>snipMateNextOrTrigger

"Appearance
Plugin 'itchyny/lightline.vim'
let g:minimap_highlight='Visual'
highlight LineNr ctermfg=black
highlight CursorLineNr ctermfg=black
set relativenumber

"minimalism
Plugin 'junegunn/goyo.vim'
Plugin 'freshdried/limelight.vim'
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
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
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
Plugin 'christoomey/vim-tmux-navigator'
nore ; :
imap jk <esc>
imap q: :q
command W w !sudo tee % > /dev/null
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Mycorrhizome
nmap <F3> dd:echo system('str="$(date +"%F %H:%M")";str="$str$(echo '.shellescape(@").')";str=(${str:0:-1});echo $str>> $HOME/text/done')<CR>:echo 'Nice Job!'<CR>
imap <F6> <esc>:r!echodate<CR>A
nmap <F7> <esc>:r!t --now <CR>A  -  <esc>0i<backspace><esc>A
" autocmd BufEnter thoughts.md normal G
autocmd BufEnter thoughts.md set ft=markdown
autocmd BufEnter s set ft=markdown

"end
call vundle#end()
filetype plugin indent on
