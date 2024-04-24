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
iabbrev #b /************************* <CR> author : mostafa khaled <C-o>:r !date<CR>
iabbrev #e  *************************/

inoremap {<CR> {<CR>}<C-o><S-o>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
nnoremap <F1> :CocCommand clangd.switchSourceHeader<CR>

