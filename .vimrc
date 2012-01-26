:set enc=utf-8
:set fenc=utf-8
:set fencs=iso-2022-jp,enc-jp,cp932
:set number
:set ts=4 sw=4 sts=0

set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>



"============== for Bundle  ==================== 
" do setup like bellow
" $ git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git

set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
" original repos on github 
" Bundle 'Shougo/neocomplcache' 
" vim-scripts repos 
Bundle 'neocomplcache'
Bundle 'ZenCoding.vim' 
Bundle 'yanktmp.vim'
" vim-scripts repos (colorscheme)
Bundle 'Color-Sampler-Pack'
Bundle 'ScrollColors'
" non github repos 
Bundle 'git://git.wincent.com/command-t.git' 
filetype plugin indent on


"============== for neocomplcache ============= 
let g:neocomplcache_enable_at_startup=1


"============== for colorscheme ==============
syntax on
colorscheme wombat256


"============== for scrollcolors ============= 
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>


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

