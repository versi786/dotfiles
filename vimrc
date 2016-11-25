" Aasif Versi's .vimrc
" http://dougblack.io/words/a-good-vimrc.html

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add plugins after this line
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief hel/
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Airline {{{
set laststatus=2            " show whole status bar
set noshowmode              " Airline does this for us
" use powerline fonts
let g:airline_powerline_fonts = 0
" Syntastic integration
let g:airline#extensions#syntastic#enabled = 1
" }}}

" Colors and GVim {{{

syntax enable
"set t_Co=256
set term=xterm-256color
set background=dark
colorscheme solarized

" }}}

" spaces and tabs {{{
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces inserted/deleted while editing
set expandtab               " tabs are spaces
set shiftwidth=4            " an indent is 4 spaces
set shiftround              " round to nearest multiple of shiftwidth
filetype indent on
filetype plugin on
set autoindent              " auto indent
"execute "set listchars=tab:\u2023\u2023"
set listchars=eol:¶,tab:>-,extends:>,precedes:<
set list                    " make tab characters very obvious
" make backspace unstupid: erase autoindents, join lines
set backspace=indent,eol,start
" }}}


" UI Config {{{
set number                  " show line numbers
set showcmd                 " show command in bottom bar (hidden by Airline)
set cursorline              " highlight current line
" hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   cterm=NONE ctermbg=234 " bloomberg color line

set wildmenu                " visual autocomplete for command menu
"set lazyredraw              " only redraw when we need to
set showmatch               " highlight matching [{()}]

" shift is for losers
nnoremap ; :
vnoremap ; :

" set paste                   " don't indent pasted text (backwards on nvim)
set wrap                      " wrap lines
set linebreak                 " break over-long lines
" set textwidth=80            " enforce 80 characters

" kill backups
" set nobackup
" set nowb
" set noswapfile
"
" UTF-8 encoding, unix endings
set encoding=utf8
set ffs=unix,dos,mac

" }}}

" search {{{
set incsearch " starts seach immediately
set ignorecase " ignore case of the seach
set smartcase " except when the first letter is capitalized
set hlsearch " highlight words that are searched for
nnoremap <leader>q :nohlsearch<CR> " clear search
" }}}

" Movement {{{
" move vertically by visual line (not line number)
nnoremap j gj
nnoremap k gk

" beginning of line = beginning of text
map 0 ^

" highlight last inserted text
nnoremap gV `[v`]

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
"}}}

" Windows and Tabs {{{
set splitbelow              " new hoz splits go below
set splitright              " new vrt splits go right

" move between windows sensibly
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" }}}

" BUffers {{{

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" }}}

" Leader {{{
let mapleader=","           " leader is comma

" jk is escape (in insert mode)
inoremap jk <Esc>

" edit vimrc/bash_profile and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>eb :e ~/.bash_profile<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session, reload with vim -S
nnoremap <leader>s :mksession<CR>
" }}}

" Autogroups {{{
augroup columnLimit
    if exists('+colorcolumn')
        set colorcolumn=80
        " highlight ColorColumn ctermbg=234
    else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif
augroup END

" highlight soln/stubwith/etc
augroup highlightwords
        autocmd!
        autocmd Syntax * call matchadd('Todo',
                                \ '\W\zs\(WARNING\|NOTE\|INFO\|IDEA\|TODO
                                \  \|TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\|SOLN\|STUBWITH\)')
augroup END

" remove trailing whitespace
fun! <SID>StripTrailingWhitespace()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
endfun

augroup whitespace
        autocmd!
        autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
augroup END

" config for fileypes
augroup configgroup
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd FileType c,h,html,css  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd BufRead,BufNewFile *.md setlocal colorcolumn=0 filetype=markdown
    autocmd BufRead,BufNewFile *.txt setlocal colorcolumn=0
augroup END

" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'

" set path += "**" " get CtrlP functionality without ctrlP
" }}}

" nerdTree {{{
nmap <silent> <leader>f :NERDTreeToggle<cr>
