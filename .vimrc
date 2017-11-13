"=========================
" baseConfig 基本配置 
"=========================
set nocompatible " 必须
set backspace=2
"共享系统剪切板
set clipboard=unnamed
set autoread
"切换文件时自动保存buffer
set autowriteall
set smartindent
" 行号设置
set number " 开启行号
set numberwidth=5

" 文件编码设置
set fileencodings=utf-8,bg18030,gbk,big5
set splitbelow
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
set smartcase
"======================================
" myPlug我的插件
"=======================================
call plug#begin('~/.vim/plugged')
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
" 自动闭合
Plug 'jiangmiao/auto-pairs'
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
"防止buffer delete窗口关闭
Plug 'moll/vim-bbye'
" 多光标操作
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"中文切换问题
Plug 'CodeFalling/fcitx-vim-osx'

" 函数导航
function! BuildTagbar(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g jsctags
  endif
endfunction
Plug 'majutsushi/tagbar', {'do': function('BuildTagbar')}

function! BuildInstantMarkdown(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g instant-markdown-d
  endif
endfunction
Plug 'suan/vim-instant-markdown', {'do': function('BuildInstantMarkdown')}
" 语法检查
Plug 'w0rp/ale'
" 自动格式化
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
"多光标选择
let g:multi_cursor_quit_key='<C-c>'
let g:multi_cursor_start_key='<leader>n'
imap <C-c> <Esc>
" 关闭搜索高亮
map <C-n> :nohl<cr>
" 折叠/展开nerdtree
nmap <F5> :NERDTreeToggle<cr>
nmap <F6> :TagbarToggle<CR>
nmap <F8> <Plug>(ale_fix)
"搜索文件
nnoremap <Leader>sf :FZF<CR>
nnoremap <Leader>sc :CtrlSF<Space>
nnoremap <Leader>st :CtrlSFToggle<CR>
"选择搜索结果
vmap     <Leader>sc <Plug>CtrlSFVwordPath
" 选中搜索 - 结果列表
vmap     <Leader>sl <Plug>CtrlSFQuickfixVwordPath

" 映射切换buffer的键位
" 上一个buffer
nnoremap <leader>bp :bp<CR> 
" 下一个buffer
nnoremap <leader>bn :bn<CR>
" 关闭当前buffer
nnoremap <leader>bd :Bdelete<CR>
" 所有buffer
nnoremap <leader>bf :buffers<CR>:buffer<Space>
" 之前打开的buffer
nnoremap <leader>bb :b#<CR>
" 跳转到浏览器
nnoremap <leader>tb :TernDocBrowse<cr>
" 显示变量定义
nnoremap <leader>tt :TernType<cr>
" 跳转到定义处
nnoremap <leader>tf :TernDef<cr>
" 显示文档
nnoremap <leader>td :TernDoc<cr>
" 预览窗口显示定义处代码
nnoremap <leader>tp :TernDefPreview<cr>
" 变量重命名
nnoremap <leader>tr :TernRename<cr>
" location 列表显示全部引用行
nnoremap <leader>tl :TernRefs<cr>
"快速选择（）里面内容快捷键
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <C-c> :call multiple_cursors#quit()<CR>
" ========== pluginConfig 插件相关的配置 ============

" ========================
" NERD tree
" ========================
" 默认隐藏
"let NERDTreeQuitOnOpen = 1
let NERDChristmasTree=0
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.svn']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" 共享tab
"let g:nerdtree_tabs_open_on_console_startup=1

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
" tab number
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#tabline#switch_buffers_and_tabs=1
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#buffer_nr_show = 0
"let g:airline#extensions#tabline#fnametruncate = 16
"let g:airline#extensions#tabline#fnamecollapse = 2
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#hunks#enabled = 1
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
let g:ctrlsf_default_view_mode = 'compact'
"=========================
" tagbar 配置 
"=========================
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
"let g:tagbar_left = 1
let g:tagbar_width = 50 
let g:tagbar_autofocus=1
let g:tagbar_type_javascript = {
\ 'ctagsbin' : 'jsctags'
\ }
"=========================
" muti_cursor 配置 
"=========================
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
"=========================
" YCM 配置 
"=========================
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
"=========================
" tern 配置 
"=========================
" 鼠标停留在方法内时显示参数提示
let g:tern_show_argument_hints = 'on_hold'
" 补全时显示函数类型定义
let g:tern_show_signature_in_pum = 1
