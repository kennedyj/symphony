" Based on
runtime colors/grb256.vim

let g:colors_name = "light"

hi Comment      ctermfg=243
hi LineNr       ctermfg=247
hi Directory    ctermfg=12
hi MoreMsg      ctermfg=70
hi Question     ctermfg=29
hi WildMenu     ctermfg=237
hi FoldColumn   ctermfg=29
hi DiffText     ctermfg=251
hi SignColumn   ctermfg=29

hi Function     ctermfg=93
hi Constant     ctermfg=14
hi Identifier   ctermfg=22
hi Statement    ctermfg=18
hi Type         ctermfg=130
hi Operator     ctermfg=33
hi String       ctermfg=2

hi Visual                   ctermbg=246
hi CursorLine               ctermbg=252  cterm=bold
hi Search       ctermfg=0   ctermbg=58   cterm=NONE
hi SpellBad     ctermfg=160 ctermbg=NONE cterm=underline term=NONE


augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

