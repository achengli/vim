source $HOME/.config/nvim/vim/util.vim

" Gnome theme selection | gnome dependant.
let s:gnome_version = system('gnome-shell --version | grep -Eo "[0-9]+\.[0-9]+"')

if str2nr(s:gnome_version) < 47
  let s:gnome_theme = system('gsettings get org.gnome.desktop.interface gtk-theme | grep -vE dark')
else
  let s:gnome_theme = system('gsettings get org.gnome.desktop.interface color-scheme | grep -E "default"')
endif

" Load configuration
for file in ['opt.vim', 'plug/init.vim', 'map.vim', 'lsp.vim', 'conf.vim']
  call util#source(file)
endfor

<<<<<<< HEAD
" To edit the colorscheme go to after/plugin/colorscheme.rc.vim 
=======
" Edit after/plugin/colorscheme.rc.vim to change the theme for light and dark
" modes.
>>>>>>> b3f6c1b (cleanup)
if len(s:gnome_theme) == 0
  let g:scheme_variant='dark'
else
  let g:scheme_variant='light'
endif
