call plug#begin('~/.vim/plugged')
" Git插件
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" 底部状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 模糊搜索打开文件 , 需要fzf与ag支持
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox' " ColorScheme
Plug 'preservim/nerdtree' " 树目录
Plug 'mhinz/vim-startify' " 启动界面
Plug 'ctrlpvim/ctrlp.vim' " 模糊打开文件
Plug 'tpope/vim-surround' "成双成对 - 不怎么用
Plug 'preservim/nerdcommenter' "代码注释
Plug 'easymotion/vim-easymotion' " 快速搜索定位
Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码提示
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

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

set foldmethod=manual " 按手工折叠 zf - za
"set foldmethod=indent " 按缩进折叠 zm - zr
"set foldmethod=syntax " 按语法折叠 zm - zr
set foldcolumn=4 " 左侧显示折叠信息的宽度

let mapleader=','
let g:mapleader=','

autocmd BufWinLeave *.* mkview " 退出时保存当前视图
autocmd BufWinEnter *.* silent loadview " 打开时自动加载保存的视图
" Jump to the last location when reopening the file
if has("autocmd")                                                          
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
endif 

" key=>map =======================================================>>
" sudo to write
cnoremap w!! w !sudo tee %>/dev/null
" execute current file
nnoremap <F5> :!%:p<cr>
" exit insert mode
inoremap jj <Esc> 
" leader write file
nnoremap <Leader>w :w<CR>
" remove trailing spaces
nnoremap <leader>D :%s/\s\+$//<cr>:let @/=''<CR> 
nnoremap <leader>t :terminal ++rows=10<CR> 


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


" tools =======================================================>>
com! FormatJSON %!python3 -m json.tool " json format

" Plug config ====================================================>>
" ==> Plug Scheme
set background=dark
colorscheme gruvbox
"set term=screen-256color


" ==> Plug mhinz/vim-startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks= [
            \ '~/workspaces/',
            \]
let g:startify_files_number = 5 
let g:startify_session_autoload = 1
let g:startify_skiplist = [
       \ '^/tmp',
       \ ]

" ==> Plug scrooloose/nerdtree
nmap <Leader>g :NERDTreeToggle<cr>
nmap <Leader>f :NERDTreeFind<cr>
let NERDTreeIgnore = ['\.git$']
let NERDTreeShowBookmarks=1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" ==> Plug junegunn/fzf.vim
nnoremap ff :Files <CR>
nnoremap <c-g> :Ag <CR>


" ==> Plug easymotion/vim-easymotion
nmap ss <Plug>(easymotion-s2)


" ==> Plug ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'


" ==> Plug vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1


" ==> Plug 'airblade/vim-gitgutter'
set updatetime=200


" ==> Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'✭',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }


" ==> Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码提示
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-sh', 'coc-sql', 'coc-xml', 'coc-html', 'coc-css', 'coc-clangd']


" other =====================================================>


" PS ==========================================================================================================================>
" ==> Plug 'preservim/nerdcommenter' "代码注释
" ,ca在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//  
" ,cc注释当前行
" ,c<space> 切换注释/非注释状态
" ,cs 以”性感”的方式注释
" ,cA 在当前行尾添加注释符，并进入Insert模式
" ,cu 取消注释
" ,c$ 从光标开始到行尾注释  ，这个要说说因为c$也是从光标到行尾的快捷键，这个按过逗号（，）要快一点按c$
" 2,cc 光标以下count行添加注释 
" 2,cu 光标以下count行取消注释
" 2,cm:光标以下count行添加块注释(2,cm)
" Normal模式下，几乎所有命令前面都可以指定行数
" Visual模式下执行命令，会对选中的特定区块进行注释/反注释

" ==> 代码折叠
" zf[n] 折叠代码 n>数字(行数), %(下一个括号) ...
" za 展开|收缩 折叠
" zd 删除折叠

" ==> 标签操作
" 在vim文件中使用t 打开新标签
" gt 下一个标签页
" gT 上一个标签页

" ==> 快速搜索&定位
" :Files | ff 打开fzf首页窗
" :Ag | <c-g> 打开ag搜索窗
" <c-p> 打开ctrlP搜索
" ss 可视范围内的快速定位

