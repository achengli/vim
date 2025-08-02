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

inoremap <silent><expr> <c-o> coc#refresh()

nmap <silent><nowait> <c-p> <Plug>(coc-diagnostic-next)
nmap <silent><nowait> <c-n> <Plug>(coc-diagnostic-prev)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


