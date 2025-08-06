set relativenumber
set syntax="on"

set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus

set backspace=indent,eol,start

set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes

set encoding=utf-8

set mouse=a
set guicursor="n-c-v:block-nCursor/i-ci:ver10-iCursor-binkwait300-blinkon200-blinkoff-100"

" Beam cursor for insert mode and block cursor for normal mode
let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"

if has('termguicolors')
  set termguicolors
endif
