function! util#source(path)
	let full_path = $HOME . '/.config/nvim/vim/' . a:path
	exec 'source ' . full_path
endfunction

function! KaTeX()
  call insert("{{< katex >}} {{< /katex >}}")
endfunction

function! StrSplit(str, spl)

  let r = []
  let s = ''

  for i in range(0, len(str)-1)
    if str[i] == spl
      let r = insert(r, s)
      let s = ''
    else
      let s = s . str[i]
    endif
  endfor

  if strlen(s) > 0
    let r = insert(r, s)
  endif
  
  return r

endfunction

function! LoadVimScript()

  let l:dirs = readdir('.')
  let s:auto = false

  for dir in dirs
    if dir == '.auto.vim'
      let s:auto = true
    endif
  endfor

  if s:auto == true
    let s:auto = false
    for line in readfile(".auto.vim", '', 3)
      if matchstr(line, 'let g:auto_password ?= ?"\[a-zA-Z0-9#@$%!-_ \]\+" \+$')
        let g:auto_password = matchstr(line, '\[a-zA-Z0-9#@$%!-_ \]\+')
      endif
    endfor
  endif

  if s:auto == true && sha256(g:auto_password) == g:auto_hashkey
    source .auto.vim
  endif

endfunction


let g:auto_hashkey = "4e883c04d25d85e277d2f93548d10d1e4cd01ef1a4b223ed71bd4ffde2ace194"
