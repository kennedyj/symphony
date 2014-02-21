" load vim-airline
set rtp+=~/.vim/bundle/vim-airline/

" for vim-airline status line
let g:airline_theme='bubblegum'     " i prefer pastels
let g:airline_left_sep=''           " remove the left separator, cause who needs special fonts!
let g:airline_right_sep=''          " same as above, but for the right

let g:airline#extensions#tabline#show_tab_nr = 1       " show tabe numbers
let g:airline#extensions#tabline#tab_nr_type = 1       " use tab number
let g:airline#extensions#tabline#enabled = 1           " always show the tab line
let g:airline#extensions#tabline#left_sep = ''         " remove the tab line left separator
let g:airline#extensions#tabline#right_sep = ''        " same as above, but for the right
let g:airline#extensions#tabline#left_alt_sep = ''     " remove the left alternate separator

" enable if you want this instead of buffeline
let g:airline#extensions#tabline#show_buffers = 0      " show buffers
let g:airline#extensions#tabline#buffer_nr_show = 0    " show buffer numbers

" for patching the theme
"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
"  if g:airline_theme == 'badwolf'
"    for colors in values(a:palette.inactive)
"      let colors[3] = 245
"    endfor
"  endif
"endfunction


