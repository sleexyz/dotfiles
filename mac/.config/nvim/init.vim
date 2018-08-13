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
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'reasonml-editor/vim-reason'


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


"Goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()


call plug#end()
