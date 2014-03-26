" for python development
set rtp+=~/.vim/bundle/pyflakes/
set rtp+=~/.vim/bundle/pydoc/

let NERDTreeIgnore += ['\.pyc$']

" ignore pyc in ctrlp
call organism#ctrlpignorefile('\.pyc$')

autocmd FileType python set omnifunc=pythoncomplete#Complete
