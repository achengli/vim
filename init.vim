source $HOME/.config/nvim/vim/util.vim

for file in ['opt.vim', 'plug/init.vim', 'map.vim', 'lsp.vim', 'conf.vim']
  call util#source(file)
endfor

color modus_vivendi

hi Normal guibg=none ctermbg=none
hi! link NormalFloat Normal
hi! link NormalNC Normal
hi! link SignColumn Normal
hi NonText guibg=none
hi LineNr ctermbg=none guibg=none
hi LineNrBelow guibg=none
hi LineNrAbove guibg=none
hi StatusLine guibg=none guifg=White
hi FloatBorder guibg=none
hi Comment gui=italic

let g:slimv_impl = 'sbcl'
