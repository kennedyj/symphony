" all the keymappings

" map alt/meta + [ ] n to tab prev, next and new
" on mac make sure the meta key sends esc for these to work
map - :tabp<CR>
map = :tabn<CR>
map + :tabnew<CR>
" map ctrl - and + to buffer prev and next respectivly
map  :bprev<CR>
map = :bnext<CR>

" misc
map <C-d> :q<CR>

" for Gundo http://sjl.bitbucket.org/gundo.vim/
nnoremap <F8> :GundoToggle<CR>

" for toggling paste
map <F9> :set invpaste<CR>          " Paste Toggle on F9
map ,p :set invpaste<CR>            " Paste Toggle on ,p

map ,f :CtrlP<CR>
map ,b :CtrlPBuffer<CR>

" more page up and down goodness
map <C-k> <C-b>
map <C-j> <C-f>

" for perl
"map ,pl :!clear;perl -cw % <CR>
" vi shortcuts

" reload vim configuration
map ,vr :so $MYVIMRC<CR>

" make shortcuts
map ,mt :!clear;make test<CR>

" grunt shortcuts
map ,gt :!clear;grunt test<CR>

" hide and show comments
map ,sc :highlight Comment term=bold ctermfg=white<CR>
map ,hc :highlight Comment term=bold ctermfg=darkgray<CR>
map ,nc :highlight Comment term=bold ctermfg=black<CR>

nnoremap <F10> :set invhls<CR>:let @/="<C-r><C-w>"<CR>/<BS>

