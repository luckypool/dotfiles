:set enc=utf-8
:set fenc=utf-8
":set fencs=iso-2022-jp,enc-jp,cp932
:set number
:set ts=4 sw=4 sts=0

set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>


set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" original repos on github 
NeoBundle 'Lokaltog/vim-powerline'
" Bundle 'Shougo/neocomplcache' 
" vim-scripts repos 
NeoBundle 'neocomplcache'
NeoBundle 'ZenCoding.vim' 
NeoBundle 'yanktmp.vim'
" vim-scripts repos (colorscheme)
NeoBundle 'Color-Sampler-Pack'
NeoBundle 'ScrollColors'
" non github repos 
NeoBundle 'git://git.wincent.com/command-t.git' 
filetype plugin indent on

"============== for vim-powerline ============= 
set laststatus=2

"============== for neocomplcache ============= 
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
"" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()


"============== for scrollcolors ============= 
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

"============== display setting ==============
if &term =~ "xterm-256color" || "screen-256color"
	" 256色
	set t_Co=256
	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif
syntax enable
colorscheme wombat256

"============== for yanktmp.vimrc ============
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 

"===== 前回終了したカーソル位置に移動する =====
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

