let s:vim9supported=v:false

if version >= 900 && s:vim9supported
  vim9script
  source $HOME . '/.vim/' . vim9rc
else
  let g:vimrc = getenv('HOME') . '/.vim'

  function! Load(path)
    exec 'source ' . a:path
  endfunction

  if filereadable(g:vimrc . '/vim/util.vim')
    let s:util_source_file = g:vimrc . '/vim/util.vim'
    exec 'source ' . s:util_source_file
    let s:vim_head_files = ['opt', 'plug/init', 'map', 'lsp',
          \ 'conf']
    for file in s:vim_head_files
      call Load(g:vimrc . '/vim/' . file . '.vim')
    endfor
  endif

  let g:scheme_variant = 'dark'

  set signcolumn=no

  color wolfpack

  hi LineNr ctermbg=NONE guibg=NONE ctermfg=black
  hi Normal ctermbg=NONE guibg=NONE

  if &signcolumn != 'no'
    hi SignColumn ctermbg=NONE guibg=NONE
  endif
endif
