set nocompatible
filetype off
"--------------------------------------------------
"判断系统是windows还是Linux(check operation system)
"
if has("win32")
	let $VIMFILES= $VIM.'/vimfiles'
	set rtp+=$VIM/vimfiles/bundle/vundle
	source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    source $VIMRUNTIME/delmenu.vim
    set langmenu=en_US
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
    set guifont=YaHei_Consolas_Hybrid:h14
    call vundle#rc('$VIM/vimfiles/bundle/')
else
	set rtp+=~/.vim/bundle/vundle/
	let $VIMFILES = $HOME.'/.vim'
	if has("gui_gtk2")
	      set guifont=Inconsolata\ 14,Fixed\ 14
	      set guifontwide=WenQuanYi\ Zen\ Hei\ 14
	endif
	call vundle#rc()
endif
"  编码配置 encode and decode
set enc=utf-8
set fileencoding=utf-8
set fileencodings=gb2312,utf-8,ucs-bom,gb18030,cp936
"----------------------------------------------------------
"判断是终端还是gvim(check for console or gui)
"----------------------------------------------------------
if has("gui_running")
    let g:isGUI=1
    set background=light
else
    let g:isGUI=0
    set background=dark
    let g:solarized_termcolor=256
    let g:solarized_underline=0
    set t_Co=256
    if has("win32")
        set termencoding=gbk
    endif
endif
" -----------------------------------------------------------
"使用vundle管理自己(let vundle manage vundle)
"------------------------------------------------------------


Bundle 'gmarik/vundle'
" Bundle 'tpope/vim-vividchalk'
Bundle 'altercation/vim-colors-solarized'
if has("gui_running")
    colorscheme solarized
else
    colorscheme desert
    hi Cursorline cterm=NONE ctermbg=blue ctermfg=white
endif

"Enhanced python syntax highlighting
Bundle 'hdima/python-syntax'

"automatical closing of quotes
Bundle 'Raimondi/delimitMate'

"multiple cursors
Bundle 'terryma/vim-multiple-cursors'

"语法检查器，只使用手动执行，不使用自动执行
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': [] }
let g:syntastic_python_checkers = ['python','pep8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 2
let g:syntastic_auto_loc_list = 1
" map <F4> :SyntasticCheck<CR>
map <F4> :w<Esc>:SyntasticCheck <CR>

Bundle 'bling/vim-airline'
set laststatus=2

Bundle 'tpope/vim-commentary'
nmap <BS> gcc
vmap <BS> gc

Bundle 'scrooloose/nerdtree'
"map F6 to open nerdtree window
map <F6> :NERDTreeToggle<CR>
"close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Bundle 'davidhalter/jedi-vim'
"Make sure the autoComplete do not select the first popup
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 1
let g:jedi#show_call_signatures = 0
" let g:jedi#popup_select_first = 0

Bundle 'Shougo/neocomplete'
if has("win32")
    source $VIM\vimfiles\bundle\neocomple.ini
else
    source $VIMFILES/neocomple.ini
endif
" let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0

Bundle 'Shougo/neosnippet'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

Bundle 'Shougo/neosnippet-snippets'

Bundle 'terryma/vim-expand-region'
map <Space> <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

Bundle 'majutsushi/tagbar'
let g:tagbar_width=30
" nnoremap <silent> <F8>:Tagbar<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
" nnoremap <silent> <F9> :TagbarToggle<CR>
"end Bundle----------------------------------------------

"-----------------------------------------------------------
"编写文件时的配置
filetype on
filetype plugin on
filetype plugin indent on
autocmd FileType python setlocal completeopt-=preview
"other config
set nu
"coding
set wrap
set nolinebreak
set whichwrap=b,s,<,>,[,],h,l
set scrolloff=5
set dy=lastline
set cursorline
" set showmatch
set hlsearch
set wildmenu
set nobackup
set browsedir=buffer
set autochdir
set tags=tags;
"auto indent
" set autoindent
" set cindent
" set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set smarttab
set cursorline
" share the clipboard
set clipboard+=unnamed
set shortmess=atI

" -----------------------------------------------------------

"not exchange clipboard when paste
xnoremap p pgvy
"use left and right to change tabs
noremap <silent><Right> :tabnext<CR>
noremap <silent><Left> :tabprevious<CR>
"using <c-j> <c-k> <c-l> <c-h> to change window
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"Toogle menu and toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR> 
nmap <buffer> <F5> :w<Esc>:!python %<CR>`.
runtime macros/matchit.vim "启用高级查找
set autowrite
"<C-J> break the line, opposite to <S-J>
nnoremap <C-J> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>
