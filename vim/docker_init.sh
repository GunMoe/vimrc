#!/bin/bash

apt update
apt install vim git -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp /disk/config/.vimrc ~/.vimrc
vim +PluginInstall +qall
