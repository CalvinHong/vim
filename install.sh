#!/bin/sh
if hash hln 2>/dev/null; then
  echo "hln should use"
  else
    brew install hardlink-osx
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
hln ./ ~/.vim
hln .vimrc ~/.vimrc
