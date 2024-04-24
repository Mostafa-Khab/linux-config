function! Guard_func()
  let base_name = expand("%:t:r")
  let inc_guard = base_name . '_hpp'
  call append(0, "#ifndef " . inc_guard)
  call append(1, "#define " . inc_guard)
  call append(line("$"), "#endif /* !" . inc_guard . " */")
  call cursor(1, 8)
  exe 'normal g~$ kk'
  call cursor(2, 8)
  exe 'normal g~$ kk'
  call cursor(line("$"), 8)
  exe 'normal g~$ kk'
endfunction

command! Guard call Guard_func()

function Date_func()
  call cursor(3, 0)
  read !date 
  normal kJ
endfunction

function! Header_start()
  call Guard_func()
  call append(0, "/*********************************")
  call append(1, " * author     : mostafa khaled")
  call append(2, " * date       : ")
  call Date_func()
  call append(3, " * desc       : ")
  call append(4, " ********************************/")
endfunction

autocmd BufNewFile *.hpp,*.h,*.hh call Header_start()

filetype detect
filetype plugin indent on
syntax on
set nocompatible
set ai si
set relativenumber
set expandtab
set shiftwidth=2
set wildmenu
set wildignorecase
set background=dark
set guifont=hack:14
set scrolloff=12
set sts=2

call plug#begin("$HOME/.vim/plugged")
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 
  Plug 'morhetz/gruvbox'
  Plug 'vifm/vifm.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tikhomirov/vim-glsl'
call plug#end()
colorscheme gruvbox

if(&filetype == 'c' || &filetype == 'cpp')
    
  call plug#begin("$HOME/.vim/plugged")
    Plug 'bfrg/vim-cpp-modern'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
  call plug#end()

  imap <C-k>    <Plug>(neosnippet_expand_or_jump)
  smap <C-k>    <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>    <Plug>(neosnippet_expand_target)
endif

autocmd! BufNewFile,BufRead *.vert,*.frag set ft=glsl
if has('gui_running')
  set guifont=Hack\ Nerd\ Font\ 14
endif

nnoremap <Right> <C-w>>
nnoremap <Left> <C-w><
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-

nnoremap ; :
vnoremap ; :

"system registers
nnoremap <M-y> "+y
nnoremap <M-p> "+p

nnoremap <M-d> "_d
nnoremap <M-c> "_c

vnoremap <M-y> "+y
vnoremap <M-p> "+p

vnoremap <M-d> "_d
vnoremap <M-c> "_c
"for fast and ease sake
inoremap jj <Esc>

nnoremap H ^
nnoremap L $
nnoremap n nzz
nnoremap N Nzz

command! -nargs=0 Sw w !sudo tee % > /dev/null
command! Mingw read $HOME/mingw-includes.txt
