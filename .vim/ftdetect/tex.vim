function LatexStart()
  set filetype=tex
  read /home/sasa/Templates/latex.tex
  normal kdd
endfunction

autocmd BufNewFile *.tex call LatexStart()
autocmd BufRead *.tex set filetype=tex
