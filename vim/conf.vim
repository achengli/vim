autocmd BufNewFile,BufRead *.mac silent! set filetype=maxima
autocmd BufNewFile,BufRead *.m silent! set filetype=octave

hi Comment cterm=italic gui=italic

let g:auto_password_silent=v:true
