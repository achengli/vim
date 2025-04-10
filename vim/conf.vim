autocmd BufRead,BufNew,BufCreate *.mac silent! set filetype=maxima
autocmd BufRead,BufNew,BufCreate *.m silent! set filetype=octave

hi Comment cterm=italic gui=italic
