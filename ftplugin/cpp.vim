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
nnoremap <F1> :CocCommand clangd.switchSourceHeader<CR>

if (!filereadable('makefile') && !filereadable('Makefile'))
    setlocal makeprg=g++\ '%:p'\ -o\ '%:p:r'
endif


function! Compile()
  exec "w | silent make"
  redraw!
endfunction

function! Execute()
  if (filereadable(expand('%:p:r')))
    exec "!%:p:r"
  else
    echoerr "no executable found"
  endif
endfunction

function! Compile_Execute()
  call Compile()
  call Execute()
endfunction

nnoremap <F9> :call Compile()<CR>
inoremap <F9> <Esc>:call Compile()<CR>

nnoremap <F10> :call Execute()<CR>
inoremap <F10> <Esc>:call Execute()<CR>

nnoremap <F11> :call Compile_Execute()<CR>
inoremap <F11> <Esc>:call Compile_Execute()<CR>
