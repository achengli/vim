#!/bin/bash
# Automatic install of vim-Plug in unix-like OS.
# Depending on git curl, bash, nvim and vim of course.

function install-plug() {
  if [ ! -f curl ]; 
    echo 'The script deppends on curl. Install curl before.'
    return
  fi

  if [ -f nvim ]; then
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim\
        --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  if [ -f vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

install-plug $@
