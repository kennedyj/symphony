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

" resize windows
nnoremap ,w+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap ,w- :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap ,wv+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap ,wv- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" more page up and down goodness
map <C-k> <C-b>
map <C-j> <C-f>

" for perl
"map ,pl :!clear;perl -cw % <CR>
" vi shortcuts

" reload vim configuration
map ,vr :so $MYVIMRC<CR>

" make shortcuts
map ,rmt :!clear;make test<CR>

" grunt shortcuts
map ,rgt :!clear;grunt test<CR>

nnoremap <F10> :set invhls<CR>:let @/="<C-r><C-w>"<CR>/<BS>
