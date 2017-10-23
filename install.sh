#!/bin/sh
if hash hln 2>/dev/null; then
  echo "hln should use"
  else
    brew install hardlink-osx
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
hln ./ ~/.vim
hln .vimrc ~/.vimrc
