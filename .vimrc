"=========================
" baseConfig 基本配置 
"=========================
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


"=========================
" themeConfig 主题相关设置 
"=========================
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

"======================================
" myPlugin我的插件
"=======================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 使用Vundle管理插件，必须
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" 粘贴板
Plugin 'kien/ctrlp.vim'
" 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 多光标操作
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'

" 语法检查
Plugin 'vim-syntastic/syntastic'
" 自动格式化
Plugin 'Chiel92/vim-autoformat'

" web dev
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'

call vundle#end() " 必须
filetype plugin indent on " 必须
" ========== 华丽分割线 ================

" ========== pluginConfig 插件相关的配置 ============

" ========================
" NERD tree
" ========================
" 折叠/展开快捷键
nmap <F5> :NERDTreeToggle<cr>
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" 共享tab
let g:nerdtree_tabs_open_on_console_startup=1

" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ========================
" syntastic
" ========================
let g:syntastic_javascript_checkers=['eslint']
" 格式化配置
let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_javascript = ['eslint']
" 格式化快捷键
noremap <F3> :Autoformat<CR>:w<CR>

"=========================
" ctrlp 文件检索配置
"=========================
let g:ctrlp_max_height=15

"=========================
" airline设置 
"=========================
set laststatus=2
