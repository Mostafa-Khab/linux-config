if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
set makeprg=pdflatex\ -interaction=nonstopmode\ -synctex=-1\ '%:p'\ 
		
function! OpenPDF()
  exec "!zathura '%:p:r'.pdf --synctex-forward ".line('.').":".col('.').":".expand('%:p')
  redraw!
endfunction

function! CompileTex()
  silent make
  redraw!
endfunction

nnoremap .c :call<Space>CompileTex()<CR>
nnoremap .v :call<Space>OpenPDF()<CR>
