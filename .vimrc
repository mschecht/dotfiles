"" ----------------------------------------
"" }}} OOTB Vim settings  {{{
"" ----------------------------------------

"everyone needs a leader key and I choose space
let mapleader = "\<Space>"

" How to quickly reload vim
map <leader>r :source ~/.vimrc<CR>

" How to quickly edit vimrc within vim
map <leader>ev :split ~/.vimrc<CR>

" Quickly save and exit vim
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

" Conveniently move between panes
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>l <C-W>l
nmap <Leader>h <C-W>h

" ennable the use of mouse
" YOU NEED TO PRESS alt & then click
set mouse=v

" add line numbers
set number
set relativenumber

" standard tab stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set backspace=indent,eol,start

" I like to see new lines and tabs
set list

" How to copy/paste between vim and clipboard like a normal human
set clipboard+=unnamed

filetype plugin on
"syntax on

" unable auto comment (when paste)
set paste

" Standard collors
set term=xterm-256color
set background=dark

" Highlight stuff when you search a string in your document
set hlsearch 

" make the cursor a block in normal mode
" https://superuser.com/a/634327
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

" Under line the line I'm on 
set cursorline

"" ----------------------------------------
"" }}} Snakemake syntax highlighting  {{{
"" ----------------------------------------

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake


"" ----------------------------------------
"" }}} vim-plug  {{{
"" ----------------------------------------
" this downloads vim-plug if its missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

    Plug       'morhetz/gruvbox'
    Plug       'scrooloose/nerdtree'
    Plug       'jalvesaq/Nvim-R'
    Plug       'vim-syntastic/syntastic'
    Plug       'godlygeek/tabular'
    Plug       'airblade/vim-gitgutter'
    Plug       'ctrlpvim/ctrlp.vim'
    Plug       'majutsushi/tagbar'
	Plug       'vim-airline/vim-airline'
    Plug       'davidhalter/jedi-vim'
    Plug       'morhetz/gruvbox'
    Plug       'tpope/vim-fugitive'
    Plug       'scrooloose/nerdcommenter'

  call plug#end()
endif

xnoremap <C-\> gcc


"###########################
"# Customize packages below
"###########################


let g:instant_markdown_open_to_the_world = 1
let g:airline#extensions#tabline#enabled = 1

" ---------------------------------------
" }}} morhetz/gruvbox  {{{  # color theme
" ---------------------------------------
syntax on
colorscheme gruvbox

" ---------------------------------------
" }}} tpope/vim-fugitive {{{  # Git functionality
" ---------------------------------------
map <leader>b :Git blame<CR>

" }}} nerdtree  {{{  # file explorer
" -----------------------------------------------------------------

map <leader>o :NERDTree<CR>
let NERDTreeShowLineNumbers=1

"" -----------------------------------------------------------------
"" }}} tagbar {{{  # search files using tags (e.g. methods, classes)
"" -----------------------------------------------------------------

"let g:tagbar_left = 1
let g:tagbar_show_linenumbers = 0
let g:tagbar_width = 30
map <leader>t :TagbarToggle<CR>


let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
filetype plugin indent on

" Turn on Jedi-vim
let g:jedi#completions_enabled = 1

" ----------------------------------------
" }}} questions I ask myself contantly {{{
" ----------------------------------------
" How do I switch between windows?
" https://superuser.com/questions/280500/how-does-one-switch-between-windows-on-vim

"How can I go in between vim and the command line efficiently?
"CTRL-Z
"{any sequence of shell commands}
"fg
"
"https://vi.stackexchange.com/a/16208

"How do I comment multiple lines of code out?
"THE BEST WAY!
"https://dev.to/grepliz/3-ways-to-comment-out-blocks-of-code-in-vi-6j4
