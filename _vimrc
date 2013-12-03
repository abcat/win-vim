set nocompatible
filetype off

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

"-----------------------------------------------------------------------------
"let vundle manage vundle
Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': [] }
Bundle 'bling/vim-airline'
let g:airline_left_sep=''
let g:airline_right_sep=''
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
let g:jedi#popup_select_first = 0
let g:jedi#auto_vim_configuration = 1

Bundle 'Shougo/neocomplete'
source $VIMFILES/neocomple.ini

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

Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplAutoStart = 1
let g:miniBufExplBuffersNeeded = 1

Bundle 'terryma/vim-expand-region'
map <Space> <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

Bundle 'majutsushi/tagbar'
let g:tagbar_width=30
" nnoremap <silent><F8>:Tagbar<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

"end Bundle----------------------------------------------
filetype on
filetype plugin on
filetype plugin indent on
autocmd FileType python setlocal completeopt-=preview
let g:neocomplete#enable_auto_select = 0
let g:jedi#popup_select_first = 0
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
set enc=utf-8
set fileencodings=gb2312,utf-8,ucs-bom,gb18030,cp936
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

" share the clipboard
set clipboard+=unnamed
set shortmess=atI
colorscheme desert
"not exchange clipboard when paste
xnoremap p pgvy
"use left and right to change buffers
noremap <silent><Left> :bp<CR>
noremap <silent><Right> :bn<CR>
set autowrite
im :<CR> :<CR><TAB>
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
map <F4> :SyntasticCheck<CR>
map <F5> :make<CR>
