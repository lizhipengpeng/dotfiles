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
set wildmenu
set ignorecase
set smartcase
set ttyfast "should make scrolling faster"
set lazyredraw "same as above" set autoindent
set complete-=i
set complete-=t
set clipboard=unnamedplus
set wrap
" set smartindent
filetype plugin indent on


"use the terminal
nmap ! :!

" use FZF to open file
nmap O :FZF<CR>

"remove the hlsearch
nmap <F1> :nohlsearch<CR>


" Save and quit
nmap S :w<CR>
nmap Q :q<CR>

nmap ; :
let mapleader = " "
nmap <C-A> ggVG   " 全选
xnoremap <  <gv
xnoremap >  >gv

" resize tabe size
nnoremap <S-Up> :resize -1<CR>
nnoremap <S-Down> :resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-Right> :vertical resize +1<CR>

" ===
" " === Tab management
" " ===
" Create a new tab with tu
noremap <leader>n :tabe<CR>
noremap <leader>h :-tabnext<CR>
noremap <leader>l :+tabnext<CR>

"VIM 重新打开文件时，回到上次历史所编辑文件的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


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

" plug
call plug#begin()
" Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinhwang91/rnvimr'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua'
Plug 'mg979/vim-xtabline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
" Plug 'Chiel92/vim-autoformat'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-commentary' " gcc
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
" Plug 'honza/vim-snippets'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " it's a theme
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
" Plug 'liuchengxu/vista.vim'
Plug 'lilydjwg/fcitx.vim'
" Plug 'kaarmu/typst.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
Plug 'wellle/tmux-complete.vim'
" Plug 'puremourning/vimspector'
" Plug 'skywind3000/asynctasks.vim'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'lervag/vimtex'
" Plug 'Exafunction/codeium.vim'
Plug 'sillybun/vim-repl'
Plug 'jayli/vim-easydebugger'
call plug#end()


" ===================== coc.nvim extensions =====================
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pyright', 'coc-explorer', 'coc-translator', 'coc-clangd']

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              " \: \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
" set signcolumn=no
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ====================== coc-explorer config =================
:nmap <space>e <Cmd>CocCommand explorer<CR>

"===================== rnvimr config ==================
nnoremap <silent> <M-o> :RnvimrToggle<CR>
highlight link RnvimrNormal CursorLine
let g:rnvimr_action = {
			\ '<C-t>': 'NvimEdit tabedit',
			\ '<C-x>': 'NvimEdit split',
			\ '<C-v>': 'NvimEdit vsplit',
			\ 'gw': 'JumpNvimCwd',
			\ 'yw': 'EmitRangerCwd'
			\ }


" =================== fzf_lua =====================
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :FzfLua oldfiles cwd=~<CR>
noremap <silent> <C-q> :FzfLua builtin<CR>
noremap <silent> <C-l> :FzfLua lines<CR>

" ==================== xtabline ====================
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap \p :echo expand('%:p')<CR>

" ==================== vim-table-mode ====================
noremap <LEADER>m :TableModeToggle<CR>
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" =================== autoformat =====================
" au BufWrite * :Autoformat " autoformat when saved
" noremap <LEADER>f :Autoformat<CR>
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" autocmd FileType vim,markdown let b:autoformat_autoindent=0

" ==================== suda.vim ====================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ==================== translator ================
nmap ts <Plug>(coc-translator-p)

" ==================== vim theme ====================
colorscheme catppuccin-mocha

" ==================== Markdown preview ==================
let g:mkdp_browser = "/usr/bin/chromium"
noremap <F2> :MarkdownPreview<CR>
let g:mkdp_markdown_css=''
let g:mkdp_open_to_the_world = 1

" ==================== vista ===================
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}

" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" nmap T :Vista<CR>

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'filename', 'modified', 'method' ] ]
"       \ },
"       \ 'component_function': {
"       \   'method': 'NearestMethodOrFunction'
"       \ },
"       \ }
" " How each level is indented and what to prepend.
" " This could make the display more compact or more spacious.

" " Executive used when opening vista sidebar without specifying it.
" " See all the avaliable executives via `:echo g:vista#executives`.
" let g:vista_default_executive = 'ctags'

" " Set the executive for some filetypes explicitly. Use the explicit executive
" " instead of the default one for these filetypes when using `:Vista` without
" " specifying the executive.
" let g:vista_executive_for = {
"   \ 'cpp': 'vim_lsp',
"   \ 'php': 'vim_lsp',
"   \ }

" " Declare the command including the executable and options used to generate ctags output
" " for some certain filetypes.The file path will be appened to your custom command.
" " For example:
" let g:vista_ctags_cmd = {
"       \ 'haskell': 'hasktags -x -o - -c',
"       \ }

" " To enable fzf's preview window set g:vista_fzf_preview.
" " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" " For example:
" let g:vista_fzf_preview = ['right:50%']
" " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
" let g:vista#renderer#enable_icon = 1

" " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   \"function": \"\uf794",
" \   \"variable": \"\uf71b",
" \  }
" ==================== Typst preview ==================
" nmap W :TypstWatch<CR>

" ==================== Vimspector ==================
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" function! s:read_template_into_buffer(template)
" 	" has to be a function to avoid the extra space fzf#run insers otherwise
" 	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
" 			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
" 			\   'down': 20,
" 			\   'sink': function('<sid>read_template_into_buffer')
" 			\ })
" noremap <leader>v :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=🔶 texthl=SpellBad

" ==================== asyncrun ==================
" let g:asyncrun_open = 6
" noremap <silent><f4> :AsyncTask file-run<cr>
" noremap <silent><f9> :AsyncTask file-build<cr>S



" ==================== vimtex ==================
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_compiler_method = 'latex'
" let maplocalleader = ","


" ===================== tmux =====================
let g:tmuxcomplete#trigger = 'completefunc'

" ===================== vim-repl =====================
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
