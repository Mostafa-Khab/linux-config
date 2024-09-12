if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal makeprg=pandoc\ '%:p'\ -o\ '%:p:r'.pdf
setlocal spell

function! CompileMD()
  exec "write | silent make"
  redraw!
endfunction

function! PreviewPDF()
  exec "silent !zathura '%:p:r'.pdf & disown"
  redraw!
endfunction

function! CompileMD_PreviewPDF()
  call CompileMD()
  call PreviewPDF()
endfunction


hi SpellBad ctermbg=9 ctermfg=15

noremap <F2>  <Esc>:set spell!<CR>

noremap <F9>  <Esc>:call CompileMD()<CR>
noremap <F10> <Esc>:call PreviewPDF()<CR>
noremap <F11> <Esc>:call CompileMD_PreviewPDF()<CR>
noremap <F12> <Esc>:set arabic!<CR>
