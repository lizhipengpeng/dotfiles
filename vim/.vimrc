syntax enable
syntax on
set encoding=utf-8
set fileencodings=utf-8,gbk,big5
set number
set relativenumber
set cursorline
set tabstop=5
set softtabstop=5
set shiftwidth=5
set hlsearch
set incsearch
set background=dark
set wildmenu
set ignorecase
set smartcase
set ttyfast "should make scrolling faster"
set lazyredraw "same as above"
set autoindent 
set lazyredraw
set complete-=i
set complete-=t
set clipboard=unnamedplus
" set smartindent
" filetype plugin indent on
" set mouse=a
 

"use the terminal 
nmap ! :! 

" use FZF to open file
nmap O :FZF<CR>

"remove the hlsearch
nmap <F1> :nohlsearch<CR>

" 通模式下用块状光标，在插入模式下用条状光标
if empty($TMUX)
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
     let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
     let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif


" use chromium open current file

" Save and quit
nmap S :w<CR>
nmap Q :q<CR>

" ESCAPE to CAPS_LOCK
" imap jk <esc>

nmap <space> :
nnoremap <F2> :nohls<CR>           " 取消 Vim 查找高亮显示
nmap <C-A> ggVG   " 全选 
xnoremap <  <gv
xnoremap >  >gv


" ===
" " === Tab management
" " ===
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tb :-tabnext<CR>
noremap tn :+tabnext<CR>

"VIM 重新打开文件时，回到上次历史所编辑文件的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary' " gcc
call plug#end()


" ===
" ===  auto-popmenu
" ===
" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c


"move  
inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <del>
inoremap <C-b> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


" put in mid
inoremap <C-z> <Esc>zza

" NERTree
" autocmd VimEnter * NERDTree

" Python F5 run function
filetype plugin on
map <F5> :call PRUN()<CR>
func! PRUN()
    exec "w" 
    if &filetype == 'python'
        exec "!python %"
    endif
endfunc
