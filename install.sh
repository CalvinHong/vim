#!/bin/sh
ln .vimrc ~/.vimrc
if hash brew 2>/dev/null; then
  #安装cmake
  if ! hash make 2> /dev/null; then
    brew install cmake
  fi
  #安装ag
  if ! hash ag 2> /dev/null; then
    brew install ag
  fi
  else
   echo 'installed !!' 
fi
