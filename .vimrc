"=======================================================
" base settings
" ------------------------------------------------------
set enc=utf-8
set fencs=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms,cp932
set fenc=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set ts=4 sw=4 sts=0
set expandtab
set number
set bs=indent,eol,start
set laststatus=2
set showmode
set hlsearch
set lcs=tab:>.,trail:_
set list
set backup
set mouse=a
set directory=$HOME/.vim/swp/
set backupdir=$HOME/.vim/backup/
nmap <Esc><Esc> :nohlsearch<CR><Esc>
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
" ------------------------------------------------------
" タブ操作のキーマッピング
" ------------------------------------------------------
nnoremap [TABCMD]  <nop>
nmap     <c-t> [TABCMD]
nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]j :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]k :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>
" ------------------------------------------------------
" Python
" ------------------------------------------------------
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" ------------------------------------------------------
" Perl
" ------------------------------------------------------
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t    setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
augroup END
"=======================================================


"=======================================================
" NeoBundle
" ------------------------------------------------------
" do setup like bellow...
" $ git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
" ------------------------------------------------------
set nocompatible
filetype off
if has('vim_starting')
    se runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'vim-scripts/Command-T'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/hybrid.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nakatakeshi/jump2pm.vim'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
filetype plugin indent on
"=======================================================

"=======================================================
" unite
" ------------------------------------------------------
" insert modeで開始
let g:unite_enable_start_insert=1
" buffer 一覧
noremap <c-o> :<c-u>Unite buffer -direction=botright <cr>
" file 一覧
noremap <c-i>  :<c-u>UniteWithBufferDir -buffer-name=files file-direction=botright <cr></cr></c-u></c-i></cr></c-u></c-o>
"=======================================================


"=======================================================
" The-NERD-Tree
" refered from:
" http://blog.livedoor.jp/kumonopanya/archives/51048805.html
" ------------------------------------------------------
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\.git$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
"=======================================================


"=======================================================
" jump2pm
" ------------------------------------------------------
noremap ff :call Jump2pm('e')<ENTER>
noremap fd :call Jump2pm('sp')<ENTER>
noremap ft :call Jump2pm('tabe')<ENTER>
" let search_lib_dir = [ 'local/lib/perl5' ]
"=======================================================


"=======================================================
" syntastic
" ------------------------------------------------------
" let $PERL5LIB='./lib:./t:./t/inc:'.expand('$PERL5LIB')
"=======================================================


"=======================================================
" do setup like bellow...
" (1) clone snippet files
"     $ git clone git@gist.github.com:afecd4b6cb37eb24e4c4.git ~/.vim/snippets
" (2) clone dict files
"     $ git clone git@gist.github.com:5c498d514369dcac962b.git ~/.vim/dict
" ------------------------------------------------------
" neocomplcache
" ------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }
" Dict
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'  : '',
    \ 'perl'     : $HOME.'/.vim/dict/perl.dict'
    \ }
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme'   : $HOME.'/.gosh_completions'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ------------------------------------------------------
" neosnippet
" ------------------------------------------------------
"Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" " For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif
"=======================================================


"=======================================================
" colorscheme
" ------------------------------------------------------
syntax on
" colorscheme wombat256
colorscheme hybrid
"=======================================================


"=======================================================
" yanktmp.vimrc
" ------------------------------------------------------
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 
"=======================================================


"=======================================================
" pathogen
" ------------------------------------------------------
call pathogen#infect() 
"=======================================================


"=======================================================
" 前回終了したカーソル位置に移動する
" ------------------------------------------------------
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif
"=======================================================


"=======================================================
" 文字コードの自動認識
" ------------------------------------------------------
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
        " iconvがJISX0213に対応しているかをチェック
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
if exists('&ambiwidth')
    set ambiwidth=double
endif
"=======================================================


"=======================================================
" ag.vim
" ------------------------------------------------------
let g:agprg="-H --nocolor --nogroup --column"
"=======================================================

"=======================================================
" vim-markdown
" ------------------------------------------------------
let g:vim_markdown_folding_disabled=1
"=======================================================



