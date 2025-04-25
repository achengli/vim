function! TransparentBg()
  hi Normal guibg=NONE ctermbg=NONE
  hi! link NormalFloat Normal
  hi! link NormalNC Normal
  hi! link SignColumn Normal
  hi NonText guibg=NONE
  hi LineNr ctermbg=NONE guibg=NONE
  hi LineNrBelow guibg=NONE
  hi LineNrAbove guibg=NONE
  hi StatusLine guibg=NONE guifg=White
  hi FloatBorder guibg=NONE
  hi EndOfBuffer guibg=none
  hi Comment gui=italic

  hi TelescopeBorder guibg=none
  hi TelescopePromptBorder guibg=none
  hi TelescopeResultsBorder guibg=none
  hi TelescopePromptTitle guibg=none
  hi TelescopeTitle guibg=none
  hi TelescopePreviewBorder guibg=none
  hi TelescopeResultsBorder guibg=none

  if g:scheme_variant == 'light'
    hi! Statusline guifg=#000000 guibg=none
  else
    hi! Statusline guifg=#ffffff guibg=none
  endif
  hi! StatusLineNC guifg=#e20103 guibg=none
endfunc

augroup BGTRansp
  autocmd!
  autocmd! ColorScheme * call TransparentBg()
augroup END
