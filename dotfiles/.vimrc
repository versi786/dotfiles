" vim-plugged {{{
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')

" add plugins after this line
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'urso/haskell_syntax.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
" Plug 'tell-k/vim-autopep8'
Plug 'rhysd/vim-clang-format'
" Plug 'unblevable/quick-scope'

" True color colorschemes
Plug 'sjl/badwolf'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'crusoexia/vim-monokai'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Graveyard
" Plug 'vim-syntastic/syntastic'
" Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
" }}}

" Leader {{{
let mapleader=',' " leader is comma
" }}}

" Airline {{{
set laststatus=2            " show whole status bar
set noshowmode              " Airline does this for us
" use powerline fonts
let g:airline_powerline_fonts = 1
" Syntastic integration
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
" }}}

" Syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height=1

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_warning_symbol = "⚠"
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_style_warning_symbol = '💩'

" " javascript
" let g:syntastic_javascript_checkers = ['eslint']

" " verilog
" let g:syntastic_verilog_include_dirs = ['src', 'src/include', 'include']

" " asm
" let g:syntastic_ignore_files=['asm'] " ignore asm files


" "shortucts
" map <leader>sn :lnext<cr>
" map <leader>sp :lprev<cr>

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
" colorscheme onedark
" let g:airline_theme='onedark'
" set t_ut= " force redraw of background color, different from terminal background
" }}}

" gruvbox {{{
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark
set termguicolors
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
set number "  relativenumber   " show line numbers, and relative
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
set linebreak                 " break over-long lines
" set textwidth=80            " enforce 80 characters

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
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>eb :e ~/.bash_profile<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap ]x :cclose<CR>

"Paste in visual mode without copying
" xnoremap p pgvy
vnoremap <leader>p "_dP

nnoremap <leader>o :set paste!<CR>
nnoremap <leader>h :set hlsearch!<CR>

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

" Ale {{{


" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠'

" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \}
" let g:ale_fixers = { 'javascript': ['eslint'] }

" " Set this setting in vimrc if you want to fix files automatically on save.
" " This is off by default.
" let g:ale_fix_on_save = 1

" " let g:ale_completion_enabled = 1
" let g:ale_c_parse_compile_commands = 1

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
" let g:rustfmt_autosave = 1
" }}}

" clang-format {{{
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "BinPackArguments": "false",
            \ "BinPackParameters": "false"}
" }}}

"coc {{{
let g:coc_global_extensions = [
\ 'coc-clangd',
\ 'coc-css',
\ 'coc-eslint',
\ 'coc-html',
\ 'coc-json',
\ 'coc-prettier',
\ 'coc-python',
\ 'coc-rls',
\ 'coc-tslint-plugin',
\ 'coc-tsserver',
\ 'coc-yaml',
\ ]

" Below is the default coc.nvim config from github
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType javascript,typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

" auto-pairs {{{
let g:AutoPairsCenterLine = 0
" }}}

" vim-sneak {{{
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T
" }}}

" quick-scope {{{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}
