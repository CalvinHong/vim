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
" myPlug我的插件
"=======================================
call plug#begin('~/.vim/plugged')
" 使用vim-plug管理包
Plug 'gmarik/Vundle.vim'
" YCC
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" javascript补全 
function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
" 快速注释
Plug 'scrooloose/nerdcommenter'
" 文件搜索
Plug 'kien/ctrlp.vim'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" 多光标操作
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

function! BuildInstantMarkdown(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g instant-markdown-d
  endif
endfunction
Plug 'suan/vim-instant-markdown', {'do': function('BuildInstantMarkdown')}

" 语法检查
"Plug 'vim-syntastic/syntastic'
" 自动格式化
"Plug 'Chiel92/vim-autoformat'

" web dev
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
call plug#end()
filetype plugin indent on " 必须
" ========== 华丽分割线 ================

" ========== 快捷键 ====================

" 设置leader键
let mapleader = ";"
" 折叠/展开nerdtree
nmap <F5> :NERDTreeToggle<cr>
" 格式化快捷键
noremap <F3> :Autoformat<CR>:w<CR>
" 映射切换buffer的键位
" 上一个buffer
nnoremap <leader>bp :bp<CR> 
" 下一个buffer
nnoremap <leader>bn :bn<CR>
" 关闭当前buffer
nnoremap <leader>bd :bd<CR>
"nnoremap <leader>bl :bl<CR>
" 之前打开的buffer
nnoremap <leader>bb :b#<CR>

" ========== pluginConfig 插件相关的配置 ============

" ========================
" NERD tree
" ========================
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.svn']
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

"=========================
" ctrlp 文件检索配置
"=========================
let g:ctrlp_max_height=15
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

"=========================
" airline设置 
"=========================
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#hunks#enabled = 1
