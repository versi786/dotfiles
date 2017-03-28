" Aasif Versi's .vimrc
" http://dougblack.io/words/a-good-vimrc.html

" dpkg -r vim -- to remove vim, why would you ever do this though

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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mxw/vim-jsx'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'urso/haskell_syntax.vim'
Plugin 'vim-syntastic/syntastic'

" True color colorschemes
Plugin 'sjl/badwolf'
Plugin 'joshdick/onedark.vim'
Plugin 'lifepillar/vim-solarized8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Leader {{{
let mapleader=","           " leader is comma
" }}}

" Airline {{{
set laststatus=2            " show whole status bar
set noshowmode              " Airline does this for us
" use powerline fonts
let g:airline_powerline_fonts = 1
" Syntastic integration
let g:airline#extensions#syntastic#enabled = 1
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=1

let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_style_warning_symbol = '💩'

" javascript
let g:syntastic_javascript_checkers = ['eslint']

" verilog
let g:syntastic_verilog_include_dirs = ['src', 'src/include', 'include']

" asm
let g:syntastic_ignore_files=['asm'] " ignore asm files


"shortucts
map <leader>sn :lnext<cr>
map <leader>sp :lprev<cr>

" }}}

" Colors and GVim {{{
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

syntax on
    " Solarized Settings {{{
    "colorscheme solarized8_dark
    "let g:airline_theme='solarized'
    "set background=dark
    " }}}

    " One Dark Settings {{{
    "colorscheme onedark
    "let g:airline_theme='onedark'
    " }}}

    " gruvbox {{{
    "colorscheme gruvbox
    "set background=dark
    " }}}

    " badwolf {{{
    colorscheme badwolf
    let g:airline_theme='badwolf'
    " }}}


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
set smartindent             " smart indent

set listchars=eol:¶,tab:>-,extends:>,precedes:<
set list                    " make tab characters very obvious
" make backspace unstupid: erase autoindents, join lines
set backspace=indent,eol,start
" }}}


" UI Config {{{
set number                  " show line numbers
set showcmd                 " show command in bottom bar (hidden by Airline)
set cursorline              " highlight current line
"hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   cterm=NONE ctermbg=234 " bloomberg color line

set wildmenu                " visual autocomplete for command menu
set path+=**                " seach down into sub folders for file tasks
                            " use :find to search
"set lazyredraw             " only redraw when we need to
set showmatch               " highlight matching [{()}]

" shift is for losers
nnoremap ; :
vnoremap ; :

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

" vimgrep and cope {{{
" from: http://amix.dk/vim/vimrc.html
" had to make some changes though

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*<left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-B><right><right><right><right><right><right><right><right><right>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>
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

" Shortucts {{{

" jk is escape (in insert mode)
inoremap jk <Esc>

" edit vimrc/bash_profile and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>eb :e ~/.bash_profile<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session, reload with vim -S
nnoremap <leader>s :mksession<CR>
" }}}

"" Buffers {{{

"" This allows buffers to be hidden if you've modified a buffer.
"" This is almost a must if you wish to use buffers in this way.
"set hidden

"" To open a new empty buffer
"" This replaces :tabnew which I used to bind to this mapping
"nmap <leader>T :enew<cr>

"" Move to the next buffer
"nmap <leader>l :bnext<CR>

"" Move to the previous buffer
"nmap <leader>h :bprevious<CR>

"" Close the current buffer and move to the previous one
"" This replicates the idea of closing a tab
"nmap <leader>bq :bp <BAR> bd #<CR>

"" Show all open buffers and their status
"nmap <leader>bl :ls<CR>

"" }}}

" Tabs {{{
for tab_number in [1,2,3,4, 5, 6]
      execute 'noremap <leader>' . tab_number . ' :tabnext ' . tab_number . '<cr>'
endfor

noremap <leader>nt :tabnew<cr>
noremap <leader>t :tabnext<cr>
nnoremap <leader>ct :tabclose<cr>
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
    autocmd FileType verilog setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType haskell setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd BufRead,BufNewFile *.md setlocal colorcolumn=0 filetype=markdown
    autocmd BufRead,BufNewFile *.txt setlocal colorcolumn=0 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'

" }}}

" nerdTree {{{
nmap <silent> <leader>f :NERDTreeToggle<cr>
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" helperFunctions for vimgrep {{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" }}}

" haskell {{{
map <leader>h :%!stylish-haskell<cr>
" }}}

" NerdCommenter {{{
let g:NERDAltDelims_haskell = 1
let g:NERDAltDelims_lhaskell = 1
" }}}


" Nerd Fonts {{{
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
" }}}
