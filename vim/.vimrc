" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'terryma/vim-multiple-cursors'

" VIM markdown syntax
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

" Markdown preview
Plugin 'suan/vim-instant-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Adjusting how Vim looks
set number

set relativenumber

set smartindent

set tabstop=4

set shiftwidth=4

set expandtab

set backspace=2

syntax on

set background=dark
"colorscheme solarized

inoremap jj <ESC>

" remap NERDTree to cntrl-n
:map <C-n> :NERDTree

