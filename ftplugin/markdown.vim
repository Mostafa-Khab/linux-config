if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal makeprg=pandoc\ '%:p'\ -o\ '%:p:r'.pdf

function! Compile()
  exec write
  exec "silent make"
  redraw!
endfunction

function! PreviewPDF()
  exec "silent !zathura '%:p:r'.pdf & disown"
  redraw!
endfunction

function! Araby()
  if(&arabic == 'noarabic')
    setlocal arabic
  else
    setlocal noarabic
  endif
endfunction

nnoremap <F9>  :call Compile()<CR>
nnoremap <F10> :call PreviewPDF()<CR>
nnoremap <F12> :call Araby()<CR>

inoremap <F9>  <C-o>:call Compile()<CR>
inoremap <F10> <C-o>:call PreviewPDF()<CR>
inoremap <F12> <C-o>:call Araby()<CR>
