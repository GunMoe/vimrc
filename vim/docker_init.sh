#!/bin/bash

apt update
apt install vim git 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp $PWD/config/vimrc ~/.vimrc
vim +PluginInstall +qall
