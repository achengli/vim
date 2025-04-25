source $HOME/.config/nvim/vim/util.vim

let s:gnome_theme = system('gsettings get org.gnome.desktop.interface color-scheme | grep -E "default"')

for file in ['opt.vim', 'plug/init.vim', 'map.vim', 'lsp.vim', 'conf.vim']
  call util#source(file)
endfor

if len(s:gnome_theme) == 0
  let g:scheme_variant='dark'
else
  let g:scheme_variant='light'
endif

" Modus themes
" - modus_vivendi   : dark flavour 
" - modus_operandi  : light flavour 
if g:scheme_variant == 'dark'
  color modus_vivendi
else
  color modus_operandi
endif
