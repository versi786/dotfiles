
" using checkinstall https://help.ubuntu.com/community/CheckInstalet
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
Plugin 'alvan/vim-closetag'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'urso/haskell_syntax.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
Plugin 'w0rp/ale'
Plugin 'tell-k/vim-autopep8'
Plugin 'rhysd/vim-clang-format'

" True color colorschemes
Plugin 'sjl/badwolf'
Plugin 'joshdick/onedark.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'crusoexia/vim-monokai'

" Graveyard
" Plugin 'vim-syntastic/syntastic'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'Yggdroot/indentLine'

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
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors

syntax on
    " Solarized Settings {{{
    " colorscheme solarized8_light
    " let g:airline_theme='solarized'
    " }}}

    " One Dark Settings {{{
    colorscheme onedark
    let g:airline_theme='onedark'
    set t_ut= " force redraw of background color, different from terminal background
    " }}}

    " gruvbox {{{
    "colorscheme gruvbox
    "set background=dark
    " }}}

    " badwolf {{{
    "colorscheme badwolf
    "let g:airline_theme='badwolf'
    " }}}

    " base16 {{{
    "colorscheme base16-default-dark
    " }}}

    " jellybeans {{{
    "colorscheme jellybeans
    " }}}

    " monokai {{{
    "colorscheme monokai
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

set listchars=tab:>-,extends:>,precedes:<,trail:·  " eol:¶,
set list                    " make tab characters very obvious
set conceallevel=0
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

" edit vimrc/bash_profile and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>eb :e ~/.bash_profile<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap ]x :cclose<CR>

nnoremap <leader>o :set paste!<CR>
nnoremap <leader>h :set hlsearch!<CR>

" :W will make dirs if necessary
fun! WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command! W call WriteCreatingDirs()
" }}}

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
    autocmd FileType javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType verilog setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType haskell setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd BufRead,BufNewFile *.md setlocal colorcolumn=0 filetype=markdown
    autocmd BufRead,BufNewFile *.txt setlocal colorcolumn=0 tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd Filetype json let g:indentLine_setConceal = 0
    autocmd Filetype vim setlocal foldenable foldmethod=marker foldlevel=0
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
" map <leader>h :%!stylish-haskell<cr>
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

" vimux {{{
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
" }}}

" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}

" indentLint {{{
" https://stackoverflow.com/questions/40601818/vim-displays-json-file-without-any-quotes
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" }}}

" fzf.vim {{{
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'down': '~20%' }
" }}}

" ack.vim {{{
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>w :Ack! "<cword>"<CR>
nnoremap <leader>a :Ack! <Space>
" }}}

" Ale {{{


let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = { 'javascript': ['eslint'] }

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" let g:ale_completion_enabled = 1
let g:ale_c_parse_compile_commands = 1

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

" Ultisnips {{{
let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsJumpForwardTrigger = '<C-e>'
let g:UltiSnipsJumpBackwardTrigger = '<C-f>'
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

" AutoPep8 {{{
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1
" }}}

" rust.vim {{{
let g:rustfmt_autosave = 1
" }}}

" clang-format {{{
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "BinPackArguments": "false",
            \ "BinPackParameters": "false"}
" }}}
