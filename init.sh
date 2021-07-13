
#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $PWD/config/.vimrc ~/.vimrc
echo "\n" | vim +PlugInstall +qall
