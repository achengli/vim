function! util#KaTeX()
  call insert("{{< katex >}} {{< /katex >}}")
endfunction

function! util#StrSplit(str, spl)
  " ============================ FUNCTION ==================================
  "        NAME: util#StrSplit
  " DESCRIPTION: Split a string into slices separated by a defined character.
  " The splices are stored into a ordered array.
  "  PARAMETERS: util#StrSplit (str ::string, spl ::char)
  "      RETURN: array<string>
  " ========================================================================

  let l:r = [] | let l:s = ''

  for i in range(0, len(a:str)-1)
    if a:str[i] == a:spl
      let l:r = l:r + [l:s] | let l:s = ''
    else
      let l:s = l:s . a:str[i]
    endif
  endfor

  if strlen(l:s) > 0
    let l:r = l:r + [l:s]
  endif
  
  return l:r

endfunction

function! util#LoadVimScript()
  "============================ FUNCTION ===================================
  "        NAME: LoadVimScript
  " DESCRIPTION: Automatically loads vimscript source located in the working
  " directory calling it if has the correct password.
  "  PARAMETERS:
  "      RETURN:
  " ========================================================================

  let l:dirs = readdir('.') | let l:auto = v:false

  for dir in l:dirs
    if dir == '.auto.vim'
      let l:auto = v:true
    endif
  endfor

  let l:pass_second = ''

  if l:auto == v:true

    let l:auto = v:false
    let l:auto_password = ''

    for line in readfile(".auto.vim", '', 3)
      if (len(matchstr(line, '^let g:auto_password \?= \?"[[:alnum:]#@$%!-_ ]\+" *$')) > 0)
        let l:pass_line = matchstr(line, '^let g:auto_password \?= \?"[[:alnum:]#@$%!-_ ]\+" *$')
        let l:auto_password = trim(util#StrSplit(l:pass_line, '=')[1])[1:len(l:pass_second)-2]
      endif
    endfor

    if sha256(l:auto_password) == g:auto_hashkey
      echo 'Working directory: .auto.vim file was loaded'
      source .auto.vim
    endif
  endif

endfunction

augroup AutoFile
  au VimEnter * silent! call util#LoadVimScript()
augroup END

" sha256 codified key
let g:auto_hashkey = "a2897883555df9cfeacada1cce1515ead41209634ec47a525d581e27952b0632"

