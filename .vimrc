" 将下面配置文件加入到.vimrc文件中
set nocompatible " 必须
set backspace=2

" 行号设置
set number " 开启行号
set numberwidth=5

" 文件编码设置
set fileencodings=utf-8,bg18030,gbk,big5

set showcmd
" softab
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" 显示tab空格
set list listchars=tab:»·,trail:·

" 开启文件类型检查
filetype plugin indent on

" 显示光标
set ruler
" 光标高亮
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
" 开启语法检查
syntax enable
" monokai主题颜色
colorscheme monokai

" 搜索字符高亮提示
set hlsearch

" 文字大小

" 将Vundle加入运行时路径中(Runtime path)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 使用Vundle管理插件，必须
Plugin 'gmarik/Vundle.vim'
"
" 我的插件
" ======================================
Plugin 'Valloric/YouCompleteMe'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'


" web dev
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'

" Plugin 'tstyled-componentserryma/vim-multiple-cursors'
" ========== 华丽分割线 ================
call vundle#end() " 必须
filetype plugin indent on " 必须
