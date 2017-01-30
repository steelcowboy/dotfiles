call plug#begin()

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hdima/python-syntax'
Plug 'steelcowboy/vim-colemak'
Plug 'jvirtanen/vim-octave'
Plug 'pearofducks/ansible-vim'
Plug 'lervag/vimtex'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }


call plug#end()

set expandtab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set modeline
set nu
set mouse=r
set cc=80

autocmd FileType tex set spell
autocmd FileType make setlocal noexpandtab
"autocmd FileType cpp setlocal foldmethod=syntax

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za

inoremap <F10> <C-O>zO
nnoremap <F10> zO
onoremap <F10> <C-C>zO

set clipboard+=unnamedplus
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let python_highlight_all = 1

" VimTex
let g:tex_fast = 1

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'base16'

" Syntastic
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_cpp_checkers = ['cppcheck']
 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_check_on_open = 0
 let g:syntastic_check_on_wq = 0
 let g:syntastic_cpp_cpplint_exec = 'cpplint'

 let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

" YCM
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
	\ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
	\ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
	\ 're!\\hyperref\[[^]]*',
	\ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
	\ 're!\\(include(only)?|input){[^}]*',
	\ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
	\ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
	\ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
	\ ]
