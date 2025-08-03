" control + backspace will remove the word behind the cursor.
imap <C-h> <C-w>
inoremap <C-BS> <C-w>

" Command function use to convert latex buffer to pdf using
" pdflatex
function! Tex2Pdf()
  let full_path_name = expand("%:p")
  echom "executing"
  if &filetype =~ "plaintex"
    return
  else
    echom "converting from tex to pdf"
  endif

  try 
    exec ":silent! !pdflatex " . expand("%:p")
  catch
    echom "pdflatex command raise an error"
    return
  endtry
  echom "done!"
endfunction

nnoremap <C-l> :call Tex2Pdf()<CR>
vnoremap f y/<c-r>+<CR>
nnoremap <silent> ! :nohl<CR>
