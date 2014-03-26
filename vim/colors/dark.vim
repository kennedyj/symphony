" Based on
runtime colors/grb256.vim

let g:colors_name = "dark"

hi Comment ctermfg=243
hi LineNr ctermfg=238
hi Search ctermfg=gray ctermbg=58 cterm=NONE
hi SpellBad cterm=underline ctermfg=160 ctermbg=NONE term=NONE
hi CursorLine               ctermbg=234  cterm=NONE term=NONE
hi Type                     ctermfg=147
hi Function                 ctermfg=49
hi String                   ctermfg=131 " 70,76,82-85,112-114,118-120,140,153

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

