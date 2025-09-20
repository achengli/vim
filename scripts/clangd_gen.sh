#!/usr/bin/bash

## Configuration of clangd LSP for a project.
## ----
## Copyright (C) Yassin Achengli 2025 

print_help(){
  echo -e "clang_gen.sh usage:\n---------------"
  echo " -h : show this message"
  echo " -s : search in current path the include directories"
  echo " -f : get libraries from clangd.libs file"
  echo -e "\n * clangd.libs must have needed libraries defined one for each line."
}

if ! [ -x /usr/bin/pkg-config ]; then
  echo "pkg-config not found: This script depends on pkg-config"
  exit
fi

COMPILER=gcc
unset args
declare -a args=()

# Evaluate
for arg in $@; do
  case $arg in
    -f | --file)
      lib_list_file=1;;
    -s | --search)
      search_local_libs=1;;
    -h | --help | help)
      print_help && exit;;
    -c* | --compiler*)
      COMPILER=$(echo $arg | cut -d'=' -f2) ;;
    *)
      args[${#args[@]}]="$arg"
  esac
done

echo -e "CompileFlags:\n\tAdd: [" > .clangd

# Search include directories.
if [ -n "$search_local_libs" ]; then
  if [ -d ${args[0]} ]; then
    pdir=${args[0]}  
  else
    pdir='./'
  fi
  for inc_dir in $(find $pdir -name include -type d); do
    echo -e "\t\t-I$inc_dir" >> .clangd
  done
fi

# clangd.libs has a list of libraries defined line by line
# Define your libraries in clangd.libs with
# echo -e 'lib1\nlib2\n...' > clangd.libs
if [ -n "$lib_list_file" ]; then
  args="$args $(cat clangd.libs | xargs)"
fi

if [ -n "$args" ]; then
  for flag in $(pkg-config --cflags $args | xargs); do
    if [[ ${flag:0:2} == "-I" ]]; then
      echo -e "\t\t$flag," >> .clangd
    fi
  done
fi

echo -e "\t]\n\tCompiler: $COMPILER" >> .clangd
