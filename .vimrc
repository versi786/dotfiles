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

Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
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
" Whitespace errors
let g:airline#extensions#whitespace#mixed_indent_algo = 0
let g:airline#extensions#whitespace#checks = ['indent']
let g:airline_theme='solarized'
" }}}

" Syntastic {{{
" }}}

" Colors and GVim {{{
syntax enable
set background=dark
colorscheme solarized
set t_Co=256 "Ignore Gnome terminal color scheme

if has("gui_running")
  " set guioptions-=T         " remove toolbar
  set guioptions-=e         " remove gui tabs (ugly)
  set guioptions-=r         " remove right scroll bar
  set guioptions-=L         " remove left scroll bar
  set t_Co=256              " number of terminal colors
  set guifont=Fira-Mono-Regular:h14
  set linespace=2           " increase line spacing a little
endif
" }}}

" spaces and tabs {{{
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces inserted/deleted while editing
set expandtab               " tabs are spaces
set shiftwidth=4            " an indent is 4 spaces
set shiftround              " round to nearest multiple of shiftwidth
set ai                      " auto indent

execute "set listchars=tab:\u2023\u2023"
set list                    " make tab characters very obvious
" }}}


" UI Config {{{
set number                  " show line numbers
"set showcmd                 " show command in bottom bar (hidden by Airline)
set cursorline              " highlight current line

" make backspace unstupid: erase autoindents, join lines
set backspace=indent,eol,start

" This turns on filetype detection and loading of langauge-specific indentation
" files based on that detection. These files live in ~/.vim/indent/
filetype indent on

set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{()}]

" shift is for losers
" nnoremap ; :
" vnoremap ; :

set paste                   " don't indent pasted text (backwards on nvim)

set wrap                    " wrap lines
set linebreak               " break over-long lines
set textwidth=80            " enforce 80 characters

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
" }}}

" Movement {{{
" move vertically by visual line (not line number)
nnoremap j gj
nnoremap k gk

" beginning of line = beginning of text
map 0 ^

" highlight last inserted text
nnoremap gV `[v`]

"}}}

" Windows and Tabs {{{
set splitbelow              " new hoz splits go below
set splitright              " new vrt splits go right

" move between windows sensibly
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Leader {{{
let mapleader=","           " leader is comma

" jk is escape (in insert mode)
imap jk <Esc> " doesnt work...wtf

" edit vimrc/bash_profile and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>eb :e ~/.bash_profile<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session, reload with vim -S
nnoremap <leader>s :mksession<CR>
" }}}

" Autogroups {{{
augroup columnLimit
        " autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#404040
        " autocmd BufEnter * match OverLength '\%>80v.\+'
    if exists('+colorcolumn')
        set colorcolumn=80
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
    autocmd FileType c,h  setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=4
augroup END
" }}}

" Neovim {{{
if has('nvim')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-h> <C-\><C-n><C-w>h

    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
    nnoremap <A-l> <C-w>l
endif
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
" }}}

