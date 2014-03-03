" start the plugins!
for plugin in g:local_plugins
  exec 'set rtp+=~/.vim/bundle/' . plugin
endfor

for plugin in g:personal_plugins
  exec 'set rtp+=~/.vim/bundle/' . plugin
endfor
" end plugins
