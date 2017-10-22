" 将下面配置文件加入到.vimrc文件中
set nocompatible " 必须
filetype off     " 必须

syntax enable
colorscheme monokai

" 将Vundle加入运行时路径中(Runtime path)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 使用Vundle管理插件，必须
Plugin 'gmarik/Vundle.vim'

"
" 其他插件
"

call vundle#end() " 必须
filetype plugin indent on " 必须
