function LatexStart()
  set filetype=tex
  0 read $HOME/Templates/latex.tex
endfunction

autocmd BufNewFile *.tex call LatexStart()
autocmd BufRead *.tex set filetype=tex
