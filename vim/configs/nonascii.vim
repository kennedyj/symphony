syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" find non ascii charecters
map ,rna /[^\x00-\x7F]<CR>

