call plug#begin()

let s:p_managers = ['ui', 'syntax','lsp','coding']
for pm in s:p_managers
  call Load(g:vimrc . '/vim/plug/' . pm . '.vim')
endfor

call plug#end()
