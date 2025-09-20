let g:fzf_layout = {'window' : {'width': 0.95, 'height': 0.8}}

function! s:open_or_cd(item)
  if a:item ==# '.'
    return
  elseif a:item ==# '..'
    execute 'cd ..'
    call FileBrowser()
  elseif isdirectory(a:item)
    execute 'cd ' . fnameescape(a:item)
    call FileBrowser()
  else
    execute 'edit ' . fnameescape(a:item)
  endif
endfunction

function! FileBrowser()
  let l:cmd = 'printf "" && ls -a1 --group-directories-first ' . $PWD
  call fzf#run(fzf#wrap({
        \ 'source': l:cmd,
        \ 'sink': function('s:open_or_cd'),
        \ 'options': '--no-sort --preview "bat --style=numbers --color=always {} 2>/dev/null || cat {}" --height=80% --layout=reverse --prompt="fzf browser "',
        \ }))
endfunction

command! FileBrowser call FileBrowser()

nnoremap <silent>ff :FileBrowser<CR>
nnoremap <silent> \\ :Buffers<CR>

