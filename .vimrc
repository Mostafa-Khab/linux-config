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

"RUN :PlugInstall (you must have vim-plug configured to have to command)
"coc-nvim requires node-js. install it (modern version required I think)
call plug#begin("$HOME/.vim/plugged")
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 
  Plug 'morhetz/gruvbox'
  Plug 'vifm/vifm.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tikhomirov/vim-glsl'
call plug#end()
colorscheme gruvbox

if(&filetype == 'c' || &filetype == 'cpp')
  autocmd BufNewFile *.hpp,*.h,*.hh call Header_start()

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
