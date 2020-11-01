iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
cp $PWD/config/.vimrc ~/_vimrc
vim +PlugInstall +qall
