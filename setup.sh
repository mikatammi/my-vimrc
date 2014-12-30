#!/bin/bash

ln -sv $PWD/vimrc ~/.vimrc

echo "let g:myvimrcpath='$PWD'" > ~/.vimrc_myvimrcpath

mkdir -vp ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
