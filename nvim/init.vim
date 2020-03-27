" Don't touch my C-n!
let g:multi_cursor_use_default_mapping=0

" Not a huge fan of the folding
let g:vim_markdown_folding_disabled = 1

call plug#begin()

"Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'steelcowboy/vimwiki'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hdima/python-syntax'
Plug 'steelcowboy/vim-colemak'
Plug 'jvirtanen/vim-octave'
Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-scripts/TagHighlight'
Plug 'tikhomirov/vim-glsl'
Plug 'lambdalisue/suda.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --system-libclang --system-boost
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

"nunmap o
nnoremap h o
nnoremap H O

set expandtab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set modeline
set nu
set mouse=a
"set cc=80
set autoread

filetype plugin indent on
syntax enable

autocmd FileType tex set spell
autocmd FileType make setlocal noexpandtab
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType cpp setlocal foldmethod=indent
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown,vimwiki setlocal textwidth=80
autocmd FileType html,css,htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za

inoremap <F10> <C-O>zO
nnoremap <F10> zO
onoremap <F10> <C-C>zO

set clipboard+=unnamedplus
set background=light
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

" Multi-cursor
let g:multi_cursor_next_key='<C-h>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_cpplint_exec = 'cpplint'

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

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

