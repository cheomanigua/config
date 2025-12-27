let mapleader = ","

" vim-plug
call plug#begin('~/.vim/plugged')

" plugin section
Plug 'maxmellon/vim-jsx-pretty'

" end vim-plug
call plug#end()

" filetype plugin indent on
" Set tab width and indentations with spaces (no hard tabs) 
set expandtab
set shiftwidth=2
set softtabstop=2

set autoindent
"set number " enable line numbering
syntax enable " syntax highlighting enabled

" KEY MAPPINGS
"set timeoutlen=300
"inoremap fj <C-c>l
"inoremap jf <C-c>l

nmap <leader>ee :vsplit<cr> :Explore<cr> " pressing ,ee will open Explore in a new vertical window
nmap <leader>zz :split $MYVIMRC<cr> " Pressing ,zz will open ~/.vimrc in a new window
nmap <leader>zx :source $MYVIMRC<cr> " Pressing ,zx will source the changes made in ~/.vimrc
vmap <buffer> .b "zdi<strong><c-r>z</strong><esc> " selected text between <strong></strong>
vmap <buffer> .i "zdi<i><c-r>z</i><esc> " selected text between <i></i>
vmap <buffer> .2 "zdi"<c-r>z"<esc> " selected text between "
vmap <buffer> .' "zdi'<c-r>z'<esc> " selected text between '
vmap <buffer> .¡ "zdi`<c-r>z`<esc> " selected text between `
vmap <buffer> .8 "zdi(<c-r>z)<esc> " selected text between ()
vmap <buffer> .+ "zdi[<c-r>z]<esc> " selected text between []
vmap <buffer> .ç "zdi{<c-r>z}<esc> " selected text between {}
nmap <leader>f :call ReactFunction()<cr>
nmap <leader>d i<div></div> <esc> k$6hi
nmap <leader>do o<div></div> <esc> k$6hi
nmap <leader>dO O<div></div> <esc> k$6hi
nmap <leader>s i<span></span> <esc> k$7hi
nmap <leader>so o<span></span> <esc> k$7hi
nmap <leader>sO O<span></span> <esc> k$7hi
nmap <leader>i i<i></i> <esc> k$4hi
nmap <leader>io o<i></i> <esc> k$4hi
nmap <leader>iO O<i></i> <esc> k$4hi
nmap <leader>b i<strong></strong> <esc> 9hi
nmap <leader>bo o<strong></strong> <esc> k$9hi
nmap <leader>bO O<strong></strong> <esc> k$9hi
nmap <leader>h i<a href="" target="_blank"></a> <esc> 23hi
nmap <leader>ho o<a href="" target="_blank"></a> <esc> k$23hi
nmap <leader>hO O<a href="" target="_blank"></a> <esc> k$23hi
imap <C-d> <div></div>

" SNIPPETS

function ReactFunction()
	:read ~/.vim/templates/ReactFunction.sh
endfunction



