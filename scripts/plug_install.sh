#!/bin/bash
# Automatic install of vim-Plug in unix-like OS.
# Depending on git curl, bash, nvim and vim of course.

function install-plug() {
  if [ -z "$(whereis curl | cut -d: -f2)" ]; then
    echo 'The script deppends on curl. Install curl before.'
    return
  fi

  if [ -n "$(whereis nvim | cut -d: -f2)" ]; then
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim\
        --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo 'neovim installation not found'
  fi

  if [ -n "$(whereis vim | cut -d: -f2)" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo 'vim installation not found'
  fi
}

install-plug $@
