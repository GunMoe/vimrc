call plug#begin('~/.vim/plugged')
" 启动界面
Plug 'mhinz/vim-startify'
" git相关
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" 底部状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.im' " 模糊打开文件
Plug 'tpope/vim-surround' "成双成对
Plug 'scrooloose/nerdtree' " 树目录
Plug 'easymotion/vim-easymotion' " 快速搜索定位

" other
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"
" colorscheme
Plug 'morhetz/gruvbox'
call plug#end()

" basic config ===================================================>>
syntax on " 语法高亮
set number " 显示行号
set t_Co=256 " 启用256色
set encoding=utf-8 " 使用 utf-8 编码
set cursorline " 光标所在的当前行高亮
set relativenumber " 相对行号

set tabstop=4 " 按下 Tab 键时，Vim 显示的空格数
set expandtab " 设置自动将 Tab 转为空格
set shiftwidth=4 " 缩进每一级的字符数
set softtabstop=4 " Tab 转为多少个空格

" key=>map =======================================================>>
" sudo to write
cnoremap w!! w !sudo tee %>/dev/null 
" 禁止使用上下左右键
nnoremap <Up> :echomsg "Use k"<cr>
nnoremap <Down> :echomsg "Use j"<cr>
nnoremap <Left> :echomsg "Use h"<cr>
nnoremap <Right> :echomsg "Use l"<cr>
" 窗口切换映射
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j 
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" win10 WSL system copy
map ;y : !/mnt/c/Windows/System32/clip.exe<cr>u
map ;p :read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
map! ;p <esc>:read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l

inoremap jjj <Esc>`^ "退出insert模式
com! FormatJSON %!python3 -m json.tool " json format

" Plug NERDTree config 
let mapleader=','
let g:mapleader=','
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$']

" Plug scheme config
set background=dark
colorscheme gruvbox
set term=screen-256color

" Plug vim-airline config 
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Plug easymotion config 
nmap ss <Plug>(easymotion-s2)

" other =====================================================>
"let g:ctrlp_map = '<c-p>' " 目前不知道有啥用......


" bak =======================================================
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示 (使用vim-airline替代了)
"set laststatus=2
"set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
