if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

echo "loading cpp config"

set path+=/usr/include/x86_64-linux-gnu/
set path+=/usr/include/c++/12/
set path+=/usr/local/include/

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

"custom functions
function! Guard_func()
  let base_name = expand("%:t:r")
  let inc_guard = base_name . '_hpp'
  call append(0, "#ifndef " . inc_guard)
  call append(1, "#define " . inc_guard)
  call append(line("$"), "#endif /* !" . inc_guard . " */")
  call cursor(1, 8)
  exe 'normal g~$ kk'
  call cursor(2, 8)
  exe 'normal g~$ kk'
  call cursor(line("$"), 8)
  exe 'normal g~$ kk'
endfunction

command! Guard call Guard_func()

function Date_func()
  call cursor(3, 0)
  read !date 
  normal kJ
endfunction

function! Header_start()
  call Guard_func()
  call append(0, "/*********************************")
  call append(1, " * author     : mostafa khaled")
  call append(2, " * date       : ")
  call Date_func()
  call append(3, " * desc       : ")
  call append(4, " ********************************/")
endfunction
