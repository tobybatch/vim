set nocompatible

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.twig set filetype=php
  augroup END
endif

set background=dark  
filetype plugin indent on
"set mouse=a
set autochdir
set history=1000

syntax on

set tabpagemax=15 
set showmode

if has('cmdline_info')
  set ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  set showcmd
endif

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\   " Filename
  " set statusline+=%w%h%m%r " Options
  " set statusline+=%{fugitive#statusline()} "  Git Hotness
  " set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set scrolloff=3
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F12>
set comments=sl:/*,mb:*,elx:*/
" autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Easier moving in tabs and windows
" The command <C-W>_ collapses the window to a single line
" map <C-J> <C-W>j<C-W>_
" map <C-K> <C-W>k<C-W>_
" map <C-L> <C-W>l<C-W>_
" map <C-H> <C-W>h<C-W>_
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Right> <C-W>l
map <C-Left> <C-W>h

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

nnoremap Y y$

" let mapleader = "\\"

set foldlevel=1
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

"nmap <silent> <leader>/ :nohlsearch<CR>
" Shortcuts
" Change Working Directory to that of the current file
" cmap cwd lcd %:p:h
" cmap cd. lcd %:p:h

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" let php_sql_query = 1
" let php_baselib = 1
" let php_htmlInStrings = 1
" let php_oldStyle = 1
" let php_asp_tags = 1
" let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
let php_folding = 1
" let php_sync_method = 0

highlight Folded ctermfg=grey
highlight Folded ctermbg=black

set foldmethod=indent
" highlight Folded cterm=bold ctermfg=black
" highlight FoldColumn ctermfg=red
set fillchars=fold:⋯

set guifont=Bitstream\ Vera\ Sans\ Mono\ 9

source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

nnoremap <silent> <S-F9> :TlistToggle<CR><C-W><Left>zM
let Tlist_WinWidth=60

silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'
silent execute '!mkdir -p $HOME/.vimviews'
set backupdir=$HOME/.vimbackup//
set directory=$HOME/.vimswap//
set viewdir=$HOME/.vimviews//
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker

