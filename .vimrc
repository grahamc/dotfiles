set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Only tab-complete the non-unique part of the file
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=list:longest

" Don't add additional pixels in between lines
set linespace=0
" Reserve 5 spaces for numbers along the left
set number
set numberwidth=5


" Auto-wrap text and comments after 120 characters (ct)
" Insert comment leader after hitting enter while already in a comment (r)
set formatoptions=ctr
set textwidth=120
set colorcolumn=80,120

" Four space tabs, four space tab stops, use soft tabs.
set shiftround
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
" Fold around indentations
" set foldmethod=indent

" Highlight tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

" Enable the mouse
set mouse=a

" Some things.
syntax on
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on


colorscheme bclear

" StatusLine
set ruler
set showcmd
" Enable and configure a useful status line.
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%{fugitive#statusline()}

" PHP Bits
let php_sql_query = 1
let php_htmlInStrings=1
let php_folding=1

"run file with PHP CLI (CTRL-M)
autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

" Learn how to use HJKL
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Trim all whitespace at the end of lines
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Sort CSS properties
:command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort
" Format CSS Documents, example: :gg=G
autocmd filetype css setlocal equalprg=csstidy\ -\ --sort_properties=true\ --sort_selectors=true\ --template=low\ --silent=true

" Magic:
" Sort the CSS brace contents
" Format it with csstidy
" Add a space after the :
" Be merry
fu! Css()
    SortCSSBraceContents
    exe "normal gg=G<Esc>"
    exe "%s/:/: /"
    retab
endf
command Css call Css()

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

Bundle 'bingaman/vim-sparkup'

Bundle 'tpope/vim-fugitive'
Bundle 'ap/vim-css-color'
Bundle 'mattn/gist-vim'
let g:gist_clip_command = 'pbcopy'

Bundle 'git://git.wincent.com/command-t.git'
let mapleader = ","
