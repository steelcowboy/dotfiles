call plug#begin()
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set modeline

autocmd FileType make setlocal noexpandtab
autocmd FileType cpp setlocal foldmethod=syntax

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za

set clipboard+=unnamedplus
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
