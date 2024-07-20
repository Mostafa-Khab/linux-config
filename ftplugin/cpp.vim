if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal path+=/usr/include/x86_64-linux-gnu/
setlocal path+=/usr/include/c++/12/
setlocal path+=/usr/local/include/

let g:cpp_function_highlight=1
let g:cpp_attributes_highlight=1
let g:cpp_member_highlight=1
let g:cpp_simple_highlight=0

"custom map

inoremap {<CR> {<CR>}<C-o><S-o>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
noremap <F2> <Esc>:CocCommand clangd.switchSourceHeader<CR>
noremap <F3> <Esc>:CocCommand document.toggleInlayHint<CR>

if (!filereadable('makefile') && !filereadable('Makefile'))
    setlocal makeprg=g++\ '%:p'\ -o\ '%:p:r'
endif

if (filereadable('build/makefile') || filereadable('build/Makefile'))
  setlocal makeprg=make\ -C\ build/
endif

function! Compile()
  exec "w | silent make"
  redraw!
  cwindow
endfunction

function! Execute()
  if (filereadable(expand('%:p:r')))
    exec "!%:p:r"
  elseif (filereadable(expand('%:p:h').'/build/main'))
    exec "silent !tmux splitw -p 25 -c build './main'"
  else
    echoerr "no executable found"
  endif
  redraw!
endfunction

function! Compile_Execute()
  call Compile()
  call Execute()
endfunction

noremap <F9>  <Esc>:call Compile()<CR>
noremap <F10> <Esc>:call Execute()<CR>
noremap <F11> <Esc>:call Compile_Execute()<CR>

inoremap <M-;> <Esc>mzA;<Esc>`za
nnoremap <M-;> mzA;<Esc>`z

inoremap <M-,> <><Left>

noremap <M-h> <Esc>:cprev<CR>
noremap <M-l> <Esc>:cnext<CR>
