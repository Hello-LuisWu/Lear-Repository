lua require('init')
lua require('Packer-Install')
lua require('Packer-Config/nvim-tree')
lua require('Packer-Config/noice')
lua require('Packer-Config/lualine')
lua require('Packer-Config/bufferline')
lua require('Packer-Config/telescope')
lua require('Packer-Config/leap-flit')

" hello world

" ======== Options ========

set signcolumn=number

" 折叠
set foldenable " 允许折叠
" set foldmethod=marker " 用 { } 作为折叠的首尾标志
" 6种折叠方式:
" manual           " 手工定义折叠
				" indent           " 更多的缩进表示更高级别的折叠
" expr             " 用表达式来定义折叠
" syntax           " 用语法高亮来定义折叠
" diff             " 对没有更改的文本进行折叠
" marker           " 对文中的标志折叠

" 高亮
syntax on " 代码高亮显示
syntax enable
set showmatch " 高亮显示匹配的括号

" 光标高亮行设置
set cursorline " 突出显示光标所在行（默认样式是underline）
" hi CursorLine cterm=bold ctermbg=234 " 将样式改成了 bold, 背景颜色为灰色
" hi CursorLineNr cterm=bold ctermfg=159

" 光标配置
" if &term =~ "xterm"
"	" INSERT mode
"	let &t_SI = "\<Esc>[5 q" . "\<Esc>]12;red\x7"
"	" REPLACE mode
"	let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
"	" NORMAL mode
"	let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
" endif

set whichwrap+=<,>,h,l " 光标在上一行的末尾，按右键可以跳转带下一行的开头(正常模式起作用)

set fillchars=vert:\| " 窗口间的分隔符
" set guioptions=T " 可以隐藏菜单栏

" 字体设置
set guifont=ComicCode\ Nerd\ Font:h25

" 快捷文本
ab qmail 1014150883@qq.com
ab gmail luiswuking@gmail.com
ab smail luis_wu@sina.com
ab 163 xiuxianshe@163.com
ab ymail luis_wu@yeah.net
ab 126 luis_wu@126.com

" multi windows
set splitright " 新建窗口时, 窗口会往右边放
set splitbelow " 新建窗口时, 窗口会往下边放

" 换行
set linebreak " 不在单词内部换行
" set number " 显示行号
set relativenumber " 显示相对行号
" set nu! " 显示行号的缩写
set wrap " 自动换行
function WrapEnabled()
	if &l:wrap
		set nowrap
	else
		set wrap
	endif
endfunction

" 剪贴板
set clipboard=unnamed " 启用系统剪贴板
" set paste " 粘贴保留原格式
map <leader>v :set paste<CR>
" set clipboard+=unnamed " 与系统共享剪贴板

set scrolloff=3 " 光标离窗口上下边界 3 行时窗口自动滚动

" 设置最小窗口宽高(不起作用,可忽略)
" set winwidth=5
" set winheight=2
" set winminwidth=5
" set winminheight=2

"标签页
set showtabline=2 " 2 总是显示标签页，0 不显示，1 出现多个标签页才显示
set tabpagemax=15 " 最多可以打开15个标签页，默认10个

"启用 24-bit 彩色模式
set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" 搜索/替换
" set ignorecase " 搜索忽略大小写
set ignorecase smartcase " 搜索内容都是小写则忽略大小写,包含大写字母则不忽略大小写
" 搜索前缀:
" \C搜索内容:不忽略大小写
" \c搜索内容:忽略大小写
" set smartcase " 如果有一个大写字母，则切换到大小写敏感查找
set hlsearch " 搜索结果高亮
set incsearch " 搜索输入时逐字高亮
" set nowrapscan " 搜索 按 n 时不要循环
set inccommand=split " 即时预览替换的效果

" tab缩进
set autoindent " 自动缩进
set noexpandtab " 用空格代替制表符
set tabstop=4 " 设置tab缩进为4个空格
set shiftwidth=4 " 每一级缩进长度, 同时也代表了代码折叠判定
set softtabstop=4 " 连续4个空格视为一个Tab
set noai nosi " 打开继承缩进，关闭预测缩进
set cindent " 针对C语言进行缩进
set smartindent " 开启新行时使用智能自动缩进
set list                     " 显示 <Tab> 和 <EOL>
set listchars=tab:\|\        " list 模式下 <Tab> 显示用的字符,这里设置的是 |

set wildmenu " 在命令模式下, 按 Tab 键显示命令菜单

set noautoread " 在 vim 以外编辑文件时,vim 里的文件会自动刷新

set virtualedit=block,onemore " 光标在 normol 模式下,可以定位到最后一个字的后面


" 插入模式显示绝对行号，普通模式显示相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber nonumber

" 文件类型
filetype on " 检测文件类型
filetype indent on " 针对不同文件使用相应的缩进规则（会载入相关缩进文件）
filetype plugin on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" 语言及编码
set encoding=utf-8 " 设置编辑器的字符编码
" set enc=utf-8 " 上面的缩写
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8 " 菜单显示语言
set helplang=cn " 查询帮助显示的语言
" 只编辑GBK编码的文件:
" set fileencodings=cp936
" set fileencoding=cp936
" set encoding=cp936
" 只编辑UTF-8编码的中文文件:
" set fileencodings=utf-8
" set fileencoding=utf-8
" set encoding=cp936 或者 set encoding=utf-8
" 同时支持GBK和UTF-8编码:
" set fileencodings=ucs-bom,utf-8,cp936
" set fileencoding=utf-8
" set encoding=cp936 或者 set encoding=utf-8
" fileencoding: Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也会将文件保存为这种字符编码方式 (不管是否新文件都如此)。
" fileencodings: Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。因此最好将 Unicode 编码方式放到这个列表的最前面，将拉丁语系编码方式 latin1 放到最后面。

set backspace=2 " 让 backspace 生效.不加参数则只能删除新添加的内容
" indent  " 删除自动缩进所产生的缩进
" eol     " 在行首按 backspace 与上一行合并
" start   " 删除旧的内容(打开文件之前的内容)
" 0       " 只能删除新内容,但新输入的自动缩进和换行不可删除
" 1       " 可删除新输入的内容,包括自动缩进和合并行. 不可删除旧内容,包括自动缩进和合并行
" 2       " 啥都可以删,等同于 set backspace=indent,eol,start

" 提示
" set noerrorbells " 去除输入错误提示音
set visualbell " 出错时, 发出视觉提示, 通常是屏幕闪烁
" set noeb " noerrorbells 的简写
set confirm " 处理未保存或只读文件的时候，弹出确认

" 文件备份
set nobackup " 禁止生成临时备份文件
set noswapfile " 不创建swap 临时交换文件
set nowritebackup " 编辑时不需要备份文件
set noundofile " 不创建撤销文件

" 其他
" colorscheme vim-material
set gcr=a:block-blinkon0
" set autochdir " 自动切换当前目录为当前文件所在的目录
set autowrite " 自动保存
" set shortmess=atI " 启动时不显示援助乌干达儿童的提示( 在 nvim
" 里没用,因为 nvim 根本就没有这样的提示)
" set mouse=a " 启用鼠标
set background=dark " 背景颜色为黑色
set showmode " 在底部显示插入模式/命令模式
" set ruler " 显示光标坐标
set showcmd " 显示输入的命令
set completeopt=longest,menu " 文件类型检测，加此参数才能启用自动补全
set history=1000 " 只保存1000个历史记录

" 状态行设置
" set laststatus=2 " 显示状态行，值为 0 不显示，值为 1 当有多个窗口才显示，值为2 永久显示
" set cmdheight=2 " 命令行高度, 默认 1 字符高度
" set statusline=[路径:%{expand(\"%:p\")}]%y%r%m%*%=%{\"\ \ [\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}[行:%l/%L,%p%%]
""

"======== Maps ========

""autocmd VimEnter * :map i <Up>
""autocmd VimEnter * :map j <Left>
""autocmd VimEnter * :map k <Down>

" bufferline
nnoremap t1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap t2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap t3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap t4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap t5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap t6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap t7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap t8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap t9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap gt :BufferLineCycleNext<CR>
nnoremap GT :BufferLineCyclePrev<CR>
nnoremap gc <Cmd>bw<CR>

" 重新载入配置文件

set timeoutlen=500 " 映射按键的延迟时间, 默认 1000 毫秒
let mapleader = " " " 空格为先导键

imap <leader><leader> <C-[>/<++><CR>:nohlsearch<CR>c4l

" This is maps setup of the Markdown ===
autocmd Filetype markdown inoremap <leader>ll <Enter>---<Enter><Enter>
autocmd Filetype markdown inoremap <leader>- <Enter>-<Space>
autocmd Filetype markdown inoremap <leader>= <Esc>0yf o<Esc>p0<C-a>$a
autocmd Filetype markdown inoremap <leader>bb **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <leader>ss ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <leader>uu ** <++><Esc>F*i
" autocmd Filetype markdown inoremap ` `` <++><Esc>F`i
autocmd Filetype markdown inoremap <leader>` <Enter>```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <leader>pp ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <leader>aa [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <leader>1 #<Space><Enter><Enter><++><Esc>kkA
autocmd Filetype markdown inoremap <leader>2 ##<Space><Enter><Enter><++><Esc>kkA
autocmd Filetype markdown inoremap <leader>3 ###<Space><Enter><Enter><++><Esc>kkA
" autocmd Filetype markdown inoremap <CR> <CR><CR>
nmap os <Esc>:vs ~/.config/nvim/init.vim<CR>

nnoremap <leader>/ : nohls<CR>

noremap <C-r> :w<CR>:source ~/.config/nvim/init.vim<CR>

" 成对符号补全
inoremap ( ()<++><C-[>F)i
inoremap [ []<++><C-[>F]i
inoremap { {}<++><C-[>F}i
inoremap {{ {<esc>o}<CR><++><esc>kO
" inoremap ' ''<++><C-[>F'i
inoremap ' ''
" inoremap " ""<++><C-[>F"i
inoremap " ""
inoremap < <><++><C-[>F>i

" 全角转半角
inoremap ’ ''
" inoremap ’ ''<++><C-[>F>i
" inoremap ” ""<++><C-[>F"i
inoremap ” ""
inoremap （ ()<++><C-[>F)i
inoremap 【 []<++><C-[>F]i
inoremap 「 {}<++><C-[>F}i
inoremap 《 <><++><C-[>F>i
inoremap ： :
inoremap —— _
inoremap ； ;
inoremap ， ,
inoremap 。 .
inoremap · `
inoremap ！ !
inoremap ？ ?
inoremap 、 \
inoremap ） )
inoremap 】 ]
imap 」 }
inoremap 》 >
inoremap …… ^
inoremap ￥ $
nnoremap < <<
nnoremap > >>
map :: :FloatermToggle<CR>

inoremap <leader><CR> <C-[>o
inoremap <leader><leader><CR> <C-[>O
nnoremap P o<C-[>p
noremap w b
noremap W 3b
noremap e w
noremap E 3w

" 功能键
map <F9> :set relativenumber!<Cr>
map <F10> :set number!<CR>
map <F12> gg=G

map vv <C-v>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
noremap <space> :
noremap <leader>h :h
nmap <space><space> /
map <C-n> :NvimTreeToggle<CR>
nnoremap Y <C-[>yaw
nnoremap D <C-[>daw
nnoremap U <C-r>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <leader><CR> i
nnoremap <leader><leader><CR> a
" nnoremap <C-Space> a
nnoremap 00 $
inoremap AA <C-[>0i
inoremap LL <C-[>$a
inoremap jj <C-[>
cnoremap <Space><Space> <Bs>
vnoremap <Space><Space> <C-[>
inoremap <C-d> <C-[>yypA
inoremap <C-s> <C-[>:w<CR>
map <leader>a <C-[>ggVG

nnoremap <leader>0 :res+5<CR>
nnoremap <leader>9 :vert res+5<CR>

nnoremap <leader>- :res-5<CR>
nnoremap <leader>= :vert res-5<CR>

"======== Plugs ========
call plug#begin()

" html 代码快捷补全
Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-markdown'
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" 状态行美化
""Plug 'vim-airline/vim-airline'
""Plug 'vim-airline/vim-airline-themes'

" 自动补全(补全已有的代码片段)
" Plug 'vim-scripts/AutoComplPop'

" markdown 实时预览
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" let g:mkdp_auto_start = 1

" markdown  表格自动格式化
Plug 'dhruvasagar/vim-table-mode'
" vim-table-mode
function! s:isAtStartOfLine(mapping)
	let text_before_cursor = getline('.')[0 : col('.')-1]
	let mapping_pattern = '\V' . escape(a:mapping, '\')
	let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	let g:table_mode_corner='|'
	return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
inoreabbrev <expr> <bar><bar>
			\ <SID>isAtStartOfLine('\|\|') ?
			\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
			\ <SID>isAtStartOfLine('__') ?
			\ '<c-o>:silent! TableModeDisable<cr>' : '__'



" 将系统剪贴板图片粘贴到 markdown
Plug  'ferrine/md-img-paste.vim'
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i


" coc 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 使Tab 生效
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 用回车键确定选择:
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion.

" 跳转到上一个/下一个报错的地方 
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" 查看光标所在处单词的帮助文档
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'

" 首屏菜单
Plug 'mhinz/vim-startify'

" 时钟
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/clock.nvim'
" auto enable when neovim start
let g:clockn_enable = 1
" config the clock's color
let g:clockn_color = '#000000'
" config opacity of floating window background
" 0-100 from fully opaque to transparent
" default is 100
let g:clockn_winblend = 100
" or use the ClockNormal highlight group
highlight ClockNormal guifg=ff0000
" position distance to top and right
let g:clockn_to_top = 1
let g:clockn_to_right = 1

" 主题
Plug 'hzchirs/vim-material'
let g:material_style='palenight'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme vim-material


" 代码格式化
Plug 'vim-autoformat/vim-autoformat'

call plug#end()
