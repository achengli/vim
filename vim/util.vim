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
      if (len(matchstr(line, "^let g:auto_password \\?= \\?['\"][A-Za-z0-9\\$#_\\-\\+=@%! ]\\+['\"] *$")) > 0)
        execute line
        break
      endif
    endfor

    if sha256(g:auto_password) == g:auto_hashkey
      source .auto.vim
    endif

    if !exists('g:auto_password_silent')
      echomsg 'startup .auto.vim file was loaded'
    endif

  endif
endfunction

augroup AutoFile
  au VimEnter * call util#LoadVimScript()
augroup END

" sha256 codified key
let g:auto_hashkey = "a2897883555df9cfeacada1cce1515ead41209634ec47a525d581e27952b0632"
