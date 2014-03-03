"" helpers for ctrlp
function! organism#ctrlpignoredir(path) abort
  if exists('g:ctrlp_custom_ignore')
    if has_key(g:ctrlp_custom_ignore, 'dir')
      let g:ctrlp_custom_ignore.dir .= '|' . a:path
    else
      let g:ctrlp_custom_ignore.dir = a:path
    endif
  else
    let g:ctrlp_custom_ignore = {'dir': a:path}
  endif
endfunction

function! organism#ctrlpignorefile(path) abort
  if exists('g:ctrlp_custom_ignore')
    if has_key(g:ctrlp_custom_ignore, 'file')
      let g:ctrlp_custom_ignore.file .= '|' . a:path
    else
      let g:ctrlp_custom_ignore.file = a:path
    endif
  else
    let g:ctrlp_custom_ignore = {'file': a:path}
  endif
endfunction

"" helpers borrowed from pathogen
" \ on Windows unless shellslash is set, / everywhere else.
function! organism#separator() abort " {{{1
  return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction " }}}1

" Split a path into a list.
function! organism#split(path) abort " {{{1
  if type(a:path) == type([]) | return a:path | endif
  let split = split(a:path,'\\\@<!\%(\\\\\)*\zs,')
  return map(split,'substitute(v:val,''\\\([\\,]\)'',''\1'',"g")')
endfunction " }}}1

" Backport of fnameescape().
function! organism#fnameescape(string) abort " {{{1
  if exists('*fnameescape')
    return fnameescape(a:string)
  elseif a:string ==# '-'
    return '\-'
  else
    return substitute(escape(a:string," \t\n*?[{`$\\%#'\"|!<"),'^[+>]','\\&','')
  endif
endfunction " }}}1

" Invoke :helptags on all non-$VIM doc directories in runtimepath.
function! organism#helptags() abort " {{{1
  let sep = organism#separator()
  for glob in organism#split(&rtp)
    for dir in split(glob(glob), "\n")
      if (dir.sep)[0 : strlen($VIMRUNTIME)] !=# $VIMRUNTIME.sep && filewritable(dir.sep.'doc') == 2 && !empty(filter(split(glob(dir.sep.'doc'.sep.'*'),"\n>"),'!isdirectory(v:val)')) && (!filereadable(dir.sep.'doc'.sep.'tags') || filewritable(dir.sep.'doc'.sep.'tags'))
        silent! execute 'helptags' organism#fnameescape(dir.'/doc')
      endif
    endfor
  endfor
endfunction " }}}1

command! -bar Helptags :call organism#helptags()
"" end pathogen code
