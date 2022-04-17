" General
set nocompatible    " launch vim in full-feature mode
set shortmess+=I    " Disable the default Vim startup message.
set encoding=utf-8  " Encoding
"set spell           " Enable spell-checking
set hidden          " Hide buffer of changes
set noerrorbells visualbell t_vb=   " Disable audible bell
set backspace=indent,eol,start      " Backspace behaviour fix
nmap Q <Nop>                " Unbind 'Q' key from quit prompt
filetype plugin indent on   " For plug-ins to load correctly.

" Display Settings
syntax on           " Turn on syntax highlighting.
set ruler	    " Show row and column ruler information
set number          " Show line numbers
" set relativenumber  " Show relative numbers of lines from cursor
set laststatus=1    " Always show the status line at the bottom, even if you only have one window open.
set showmode        " Display current mode (Normal, Insert)
set showcmd         " Show command as typed

" Coding Helpers
set autoindent	    " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set softtabstop=4   " Number of spaces per Tab
set wrap            " soft-wrap text

" Search
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

" Load Plugins
" NOTE: if vim returns error, grant permissions to write
" $ sudo chown -R lialka ~/.vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'       " Fugitive Vim Github Wrapper
Plug 'vim-airline/vim-airline'  " Status bar
Plug 'morhetz/gruvbox'          " Gruvbox colorscheme
Plug 'tpope/vim-surround'       " autoclose brakets

call plug#end()

" Colorscheme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
