if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap <M-,> <Esc>bdwi\begin{<Esc>pa}\end{<Esc>pa}<Esc>F\i<CR><CR><Up>

compiler tex

set makeprg=pdflatex\ -interaction=nonstopmode\ -synctex=-1\ '%:p'\ 

function! Clean()
  exec "silent !rm '%:p:r'.pdf '%:p:r'.aux '%:p:r'.synctex '%:p:r'.log"
  redraw!
endfunction
		
function! OpenPDF()
  exec "silent !zathura '%:p:r'.pdf --synctex-forward ".line('.').":".col('.').":".expand('%:p')." & disown"
  redraw!
endfunction

function! CompileTex()
  exec "write | silent make"
  redraw!
  cwindow
endfunction

function! CompileTex_Execute()
  call Clean()
  call CompileTex()
  call OpenPDF()
endfunction

nnoremap <F9>  :call<Space>CompileTex()<CR>
nnoremap <F10> :call<Space>OpenPDF()<CR>
nnoremap <F11> :call<Space>CompileTex_Execute()<CR>
nnoremap <F12> :set<Space>arabic!<CR>

inoremap <F9>  <Esc>:call<Space>CompileTex()<CR>
inoremap <F10> <Esc>:call<Space>OpenPDF()<CR>
inoremap <F11> <Esc>:call<Space>CompileTex_Execute()<CR>
inoremap <F12> <Esc>:set<Space>arabic!<CR>
