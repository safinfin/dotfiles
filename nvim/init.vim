let $CACHE = expand('~/.vim/.cache/dein')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
  let s:dein_base = $CACHE
endif

" Call dein initialization (required)
call dein#begin(s:dein_base)
call dein#add(s:dein_dir)

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Your plugins go here:
call dein#add('arcticicestudio/nord-vim')
call dein#add('folke/tokyonight.nvim')
call dein#add('cocopon/iceberg.vim')
call dein#add('catppuccin/nvim')
call dein#add('itchyny/lightline.vim')
call dein#add('itchyny/vim-gitbranch')

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set encoding=utf-8
scriptencoding utf-8
set number
set showmatch matchtime=1
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set splitright
set splitbelow
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set showtabline=2
set cmdheight=2
set pastetoggle=<leader>p
set backspace=indent,eol,start
set foldmethod=marker
set scrolloff=5
set showcmd

set clipboard&
set clipboard^=unnamedplus
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set wildmenu
set history=5000

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

set background=light
colorscheme catppuccin-latte

let g:lightline = {
  \ 'colorscheme': 'catppuccin',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }

