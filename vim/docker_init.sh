#!/bin/bash

apt update
apt install vim git curl -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $PWD/config/.vimrc ~/.vimrc
vim +PlugInstall +qall
