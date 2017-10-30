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
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" 开启语法检查
syntax enable

" monokai主题颜色
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" 搜索字符高亮提示
set hlsearch
set ic
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
"目录树tab共享
Plug 'jistr/vim-nerdtree-tabs'
"目录树git差异标示
Plug 'Xuyuanp/nerdtree-git-plugin'
"git差异提示
Plug 'tpope/vim-fugitive'
"行号旁边git差异显示
Plug 'mhinz/vim-signify'

" 快速注释
Plug 'scrooloose/nerdcommenter'
" 文件搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"全局文件搜索
Plug 'dyng/ctrlsf.vim'
"快速移动
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 多光标操作
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" 函数导航
Plug 'majutsushi/tagbar'

function! BuildInstantMarkdown(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g instant-markdown-d
  endif
endfunction
Plug 'suan/vim-instant-markdown', {'do': function('BuildInstantMarkdown')}
" 语法检查
"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
" 自动格式化
"Plug 'Chiel92/vim-autoformat'
Plug 'docunext/closetag.vim'
Plug 'terryma/vim-expand-region'

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
nmap <F6> :TagbarToggle<CR>
nmap <F8> <Plug>(ale_fix)
"搜索文件
nnoremap <Leader>sf :FZF<CR>
nnoremap <Leader>st :CtrlSFToggle<CR>
"选择搜索结果
vmap     <Leader>sw <Plug>CtrlSFVwordPath
" 选中搜索 - 结果列表
vmap     <Leader>sl <Plug>CtrlSFQuickfixVwordPath

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
"快速选择（）里面内容快捷键
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
" 快速查找文件
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" ========== pluginConfig 插件相关的配置 ============

" ========================
" NERD tree
" ========================
let NERDChristmasTree=0
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.svn']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 窗口位置
let NERDTreeWinPos="right"
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
"=========================
" airline设置 
"=========================
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
" tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#hunks#enabled = 1
"=========================
" ale 语法检查设置 
"=========================
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"=========================
" jsx 配置 
"=========================
let g:jsx_ext_required = 0
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_linters = {'css': ['stylelint']}
"=========================
" ctrlsf 配置 
"=========================
let g:ctrlsf_ackprg = 'ag'
"=========================
" tagbar 配置 
"=========================
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_left = 1
let g:tagbar_width = 25 
let g:tagbar_autofocus=1
