set nocompatible
filetype off
filetype plugin indent on    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Bundle 'altercation/vim-colors-solarized'
	Plugin 'tpope/vim-commentary' " commentary plugin for easy commenting
	Plugin 'itchyny/lightline.vim' " clean statusline plugin
	Plugin 'henrik/vim-indexed-search' " indexed search plugin for clarifying text searches
	Plugin 'SearchComplete' " tab completion for search queries
	Plugin 'ctrlpvim/ctrlp.vim' " search across all files
	Plugin 'scrooloose/nerdtree' " NerdTree lets you explore subdirectory through a sidebar
	Plugin 'majutsushi/tagbar' " Tagbar lets you view the tags in the current file - open with F8
	Bundle 'craigemery/vim-autotag'
	Plugin 'rking/ag.vim'
	Bundle 'jistr/vim-nerdtree-tabs'
call vundle#end()            " required

" Control-b to open tagbar
nmap <C-b> :TagbarToggle<CR>
" Control-n to open nerdtree
nmap <C-n> :NERDTreeTabsToggle<CR>

set csprg=/usr/local/Cellar/cscope/15.8b/bin/cscope
set csto=0
" set cst
set csverb
" C symbol
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" definition
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" functions that called by this function
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" funtions that calling this function
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" test string
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" egrep pattern
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" file
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" files #including this file
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" Automatically make cscope connections
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

" colorscheme setup for lightline.vim
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

syntax enable
set noshowmode
set number
set ai
set tabstop=2
set expandtab
set textwidth=79
set laststatus=2
set softtabstop=2
set shiftwidth=2
set autoindent
set fileformat=unix
set encoding=utf-8
set backspace=indent,eol,start
set tags=tags;/
set ignorecase
set smartcase
set vb
set history=1000
set incsearch

set background=dark
let g:solarized_termcolors=16
colorscheme solarized
