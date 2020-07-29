set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 启动界面
Plugin 'mhinz/vim-startify'
" git相关
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


" 底部状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 树目录
Plugin 'scrooloose/nerdtree'


" 需要python支持 
"Plugin 'Valloric/YouCompleteMe'
" 主题
"Plugin 'w0ng/vim-hybrid'
"Plugin 'morhetz/gruvbox'

call vundle#end()            " required
filetype plugin indent on    " required



" basic config ===================================================
" 显示行号
set number
" 使用 utf-8 编码
set encoding=utf-8
" 打开语法高亮。自动识别代码，使用多种颜色显示
syntax on
" 在底部显示，当前处于命令模式还是插入模式
set showmode
" 启用256色
set t_Co=256

" 按下 Tab 键时，Vim 显示的空格数
set tabstop=4
" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4
" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set expandtab
" Tab 转为多少个空格
set softtabstop=4
" 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
set relativenumber
" 光标所在的当前行高亮
"set cursorline
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" 在状态栏显示光标的当前位置（位于哪一行哪一列）
set ruler

" 禁止使用上下左右键
nnoremap <Up> :echomsg "Use k"<cr>
nnoremap <Down> :echomsg "Use j"<cr>
nnoremap <Left> :echomsg "Use h"<cr>
nnoremap <Right> :echomsg "Use l"<cr>

" 映射
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j 
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Plugin scheme Config 主题插件====================>>
set background=dark
"colorscheme hybrid
"colorscheme gruvbox

" Plugin vim-airline Config =======================>>
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Plugin NERDTree Config ==========================>>
let mapleader=','
let g:mapleader=','
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
