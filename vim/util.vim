" Vim utils
" -------
" Author: Yassin Achengli - Copyright (c) 2025
" Date: Jun 3 2025 

function! util#source(path)
	let full_path = $HOME . '/.config/nvim/vim/' . a:path
	exec 'source ' . full_path
endfunction

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

  let l:dirs = readdir('.') | let l:auto = false

  for dir in l:dirs
    if dir == '.auto.vim'
      let l:auto = true
    endif
  endfor

  let l:pass_second = ''
  if l:auto == true
    let l:auto = false
    for line in readfile(".auto.vim", '', 3)
      if matchstr(line, 'let g:auto_password ?= ?"\[a-zA-Z0-9#@$%!-_ \]\+" \+$')
        let l:pass_line = matchstr(line, 'let g:auto_password ?= ?"\[a-zA-Z0-9#@$%!-_ \]\+" \+$')
        let l:pass_second = trim(StrSplit(pass_line, '=')[2])
        let l:pass_second = l:pass_second[2:length(l:pass_second)-1]
      endif
    endfor
  endif

  if l:auto == true && sha256(g:auto_password) == g:auto_hashkey
    source .auto.vim
  endif

endfunction

" sha256 codified key
let g:auto_hashkey = "4e883c04d25d85e277d2f93548d10d1e4cd01ef1a4b223ed71bd4ffde2ace194"
