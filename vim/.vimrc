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

set backspace=2

syntax on

set background=dark

" remap NERDTree to ctrl-n
:map <C-n> :NERDTree
" automatically start vim if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Instant Markdown
" manually start markdown preview in browser
let g:instant_markdown_autostart = 0
:map <C-i> :InstantMarkdownPreview

" Multipule cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

" plasticboy/vim-markdown disable text folding 
let g:vim_markdown_folding_disabled = 1
