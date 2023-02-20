" vim-plugged {{{
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')

" add plugins after this line
Plug 'Valloric/MatchTagAlways'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/a.vim'

" color colorschemes
Plug 'morhetz/gruvbox'
"
" neovim plugins {{{
if has('nvim')
    Plug 'L3MON4D3/LuaSnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
endif
" }}}

call plug#end()
" }}}

" Leader {{{
let mapleader=',' " leader is comma
" }}}

" colors {{{
syntax on
" gruvbox {{{
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark
set termguicolors
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

set listchars=tab:>-,extends:>,precedes:<,trail:·,space:·  " eol:¶,
set list                    " make tab characters very obvious
set conceallevel=0
" make backspace unstupid: erase autoindents, join lines
set backspace=indent,eol,start
" }}}

" UI Config {{{
set number " relativenumber   " show line numbers, and relative
set showcmd                 " show command in bottom bar (hidden by Airline)
set cursorline              " highlight current line
"hi CursorLine term=bold cterm=bold guibg=Grey40
"hi CursorLine   cterm=NONE ctermbg=234 " bloomberg color line
set modelines=5
set modeline

set wildmenu                " visual autocomplete for command menu
set wildmode=longest,list                " bash-like tab completion
set path+=**                " seach down into sub folders for file tasks
                            " use :find to search
"set lazyredraw             " only redraw when we need to
set showmatch               " highlight matching [{()}]

" shift is for losers
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :

set wrap                      " wrap lines
"set linebreak                " break over-long lines
set textwidth=80            " enforce 80 characters

" kill backups
set nobackup
set nowb
set noswapfile
"
" UTF-8 encoding, unix endings
set encoding=utf8
set ffs=unix,dos,mac

" Do not allow mouse for clicking
set mouse=

" Show some lines below the cursor
set scrolloff=5

" Show completion menu and do not select anything by default
set completeopt=menu,menuone,noselect

" More completion
set wildmenu    " visual autocompelte for commandline menu
set wildmode=longest,lsit " bash-like tab completion
set path+=**              " search down into sub folders for file tasks
                          " use :find to search

" Used by lsp for formatting
nmap <C-f> <Nop>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
" }}}

" lightline {{{
set laststatus=2
set noshowmode
function! MyLineInfo() abort
    return line('.') . '/' . line('$')
endfunction

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ], ['precent', 'mylineinfo' ], ['fileformat', 'fileencoding', 'filetype' ] ],
    \ },
    \ 'inactive': {
    \   'left': [ [ 'relativepath' ] ],
    \   'right': [ [ 'lineinfo' ], ['percent', 'mylineinfo'] ],
    \ },
    \ 'component_function': {
    \   'mylineinfo': 'MyLineInfo',
    \ }
    \ }
" }}}

" search {{{
set incsearch " starts seach immediately
set ignorecase " ignore case of the seach
set smartcase " except when the first letter is capitalized
" set hlsearch " highlight words that are searched for
nnoremap <leader>q :nohlsearch<CR> " clear search
" }}}

" Movement {{{
" move vertically by visual line (not line number)
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" }}}

" Windows and Tabs {{{
set splitbelow              " new hoz splits go below
set splitright              " new vrt splits go right
nnoremap <silent> vv :vsp<CR>

" move between windows sensibly
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" }}}

" Shortcucts {{{

" jk is escape (in insert mode)
inoremap jk <Esc>

" make next easier
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" edit vimrc/bash_profile and load vimrc bindings
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>el :e ~/.config/nvim/init.lua<CR>
nnoremap <leader>eb :e ~/.bash_profile<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Quickfix Helpers
nnoremap [l :cprev<CR>zz
nnoremap ]l :cnext<CR>zz
nnoremap [x :copen<CR>
nnoremap ]x :cclose<CR>

"Paste in visual mode without copying
" xnoremap p pgvy
vnoremap <leader>p "_dP

nnoremap <leader>o :set paste!<CR>
nnoremap <leader>h :set hlsearch!<CR>

" search/replace for current word
nnoremap <leader>r :%s/<C-r><C-w>/<C-r><C-w>/g<left><left>

" :W will make dirs if necessary
fun! WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
    redraw!
endfunction
command! W call WriteCreatingDirs()
" }}}

" Tabs {{{
for tab_number in [1,2,3,4, 5, 6]
      execute 'noremap <leader>' . tab_number . ' :tabnext ' . tab_number . '<cr>'
endfor

noremap <leader>nt :tabnew<cr>
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
        " strip spaces at end of line
        %s/\s\+$//e
        " strip newline at end of file
        %s#\($\n\s*\)\+\%$##e
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
    autocmd Filetype lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd Filetype vim,tmux,lua setlocal foldenable foldmethod=marker foldlevel=0
augroup END
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

" nerdTree {{{
nnoremap <silent> <leader>f :NERDTreeToggle<cr>
" }}}

" Backups {{{
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup
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

" NerdCommenter {{{
let g:NERDAltDelims_haskell = 1
let g:NERDAltDelims_lhaskell = 1
let NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
" }}}

" Nerd Fonts {{{
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
" }}}

" fzf.vim {{{
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap \ :Buffers<CR>

let g:fzf_layout = { 'down': '~20%' }
" }}}

" ack.vim {{{
if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
endif

nnoremap <leader>w :Ack! "<cword>"<CR>
nnoremap <leader>s :Ack! <Space>
" }}}

" closetag {{{
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" }}}

" vimux {{{
nnoremap <leader>v :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vq :VimuxCloseRunner<CR>
" }}}

" MatchTagAlways {{{
let g:mta_filetypes = {
            \ 'javascript.jsx': 1,
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ }
" }}}

" auto-pairs {{{
let g:AutoPairsCenterLine = 0
" }}}

" quick-scope {{{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" Tagbar {{{
set complete-=t " tagbar makes 'tags' huge and completion slow
" }}}
