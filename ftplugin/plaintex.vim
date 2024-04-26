if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
set makeprg=pdflatex\ -interaction=nonstopmode\ -synctex=-1\ '%:p'\ 
		
function! OpenPDF()
  exec "!zathura '%:p:r'.pdf --synctex-forward ".line('.').":".col('.').":".expand('%:p')." & disown"
  redraw!
endfunction

function! CompileTex()
  silent make
  redraw!
endfunction

function! Araby()
  if (&arabic == 'noarabic')
    setlocal arabic
  else
    setlocal noarabic
  endif
endfunction

nnoremap <F9>  :call<Space>CompileTex()<CR>
nnoremap <F10> :call<Space>OpenPDF()<CR>
nnoremap <F12> :call<Space>Araby()<CR>

inoremap <F9>  <Esc>:call<Space>CompileTex()<CR>
inoremap <F10> <Esc>:call<Space>OpenPDF()<CR>
inoremap <F12> <Esc>:call<Space>Araby()<CR>

