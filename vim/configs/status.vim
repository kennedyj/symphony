" Here for time when you don't want airline

" set the status line
" checkout http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
set statusline=%n                   " buffer number
set statusline+=\)                  " parentheses separator
set statusline+=%f                  " path to the file
set statusline+=%m%r                " show modified and/or readonly flag
set statusline+=%w                  " show preview flag
set statusline+=%=                  " switch to the right side
set statusline+=%l                  " vurrent line
set statusline+=:                   " colon sep
set statusline+=%v                  " current column
"set statusline+=\%03.3b            " show decimal value of char under cursor
set statusline+=[\%02.2B]           " show hex value of char under cursor
set statusline+=\                   " add a space
set statusline+=%L                  " total lines
set statusline+=(%p%%)              " percent of file
