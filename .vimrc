"=======================================================
" base settings
" ------------------------------------------------------
set enc=utf-8
set fencs=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms,cp932
set fenc=utf-8
set fileformat=unix
set number
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
set directory=$HOME/.vim-swp
set backupdir=$HOME/.vim-backup
nmap <Esc><Esc> :nohlsearch<CR><Esc>
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
NeoBundle 'neocomplcache'
NeoBundle 'ZenCoding.vim'
NeoBundle 'yanktmp.vim'
NeoBundle 'Color-Sampler-Pack'
NeoBundle 'Command-T'
NeoBundle 'Align'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nakatakeshi/jump2pm.vim'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'scrooloose/nerdtree'
filetype plugin indent on
"=======================================================


"=======================================================
" The-NERD-Tree
" refered from:
" http://blog.livedoor.jp/kumonopanya/archives/51048805.html
" ------------------------------------------------------
NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
"=======================================================


"=======================================================
" jump2pm
" ------------------------------------------------------
noremap ff :call Jump2pm('e')<ENTER>
noremap fd :call Jump2pm('sp')<ENTER>
"=======================================================


"=======================================================
" syntastic
" ------------------------------------------------------
" let $PERL5LIB='./lib:./t:./t/inc:'.expand('$PERL5LIB')
"=======================================================


"=======================================================
" perlomni.vim 
" ------------------------------------------------------
inoremap <C-p> <C-x><C-o>
"=======================================================



"=======================================================
" neocomplcache 
" ------------------------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
"" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
"=======================================================


"=======================================================
" colorscheme
" ------------------------------------------------------
syntax on
colorscheme wombat256
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
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif
"=======================================================

