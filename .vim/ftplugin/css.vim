if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

inoremap {<CR> {<CR>}<C-o><S-o>

inoremap <M-;> <Esc>mzA;<Esc>`za
nnoremap <M-;> mzA;<Esc>`z
