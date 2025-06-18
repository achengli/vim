" control + backspace will remove the word behind the cursor.
imap <C-h> <C-w>
inoremap <C-BS> <C-w>

" hook function which reloads floating diagnostics message 
" when the cursor moves around diferent lines.
function! FloatingDiagnosticsHook()
  if mode() == 'n'
    if exists('b:last_buffer_line') && b:last_buffer_line != line('.')
      lua vim.diagnostic.open_float()
    endif
    let b:last_buffer_line = line('.')
  endif
endfunction

" auto-command calls FloatingDiagnosticsHook when cursor moves
augroup DiagnosticFloat
  autocmd CursorMoved * silent! call FloatingDiagnosticsHook()
augroup END

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


function! HDLComponent()
  let cname=input('Componente: ')
  let pmap='component ' . cname . "\n" . 'port(' ."\n"
  let done=0

  while !done
    let s=input('signal name (";" to finish): ')
    if s == ';'
      let done =1
    else
      let stype = input('signal type: ')
      let pmap .= '     ' . s .' : ' . stype . ';' . "\n"
    endif
  endwhile

  let pmap.= ');' . "\n" .'end component;'
  call append(line('.'), split(pmap, "\n"))
endfunction

nnoremap <C-l> :call Tex2Pdf()<CR>
vnoremap f y/<c-r>+<CR>
nnoremap <silent> ! :nohl<CR>
