" Based on
runtime colors/grb256.vim

let g:colors_name = "dark"

hi Comment ctermfg=243
hi LineNr ctermfg=238
hi Search ctermfg=gray ctermbg=58 cterm=NONE

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

