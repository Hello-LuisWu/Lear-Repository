# coc.nvim 安装

> 目录
> [TOC]

## 安装环境

coc.nvim 需要 node 和npm包管理器

**Macos下安装node:**

```shell
brew install node
```

**也可以安装指定版本的node:**

```shell
brew install node@14
```

以上两种方式任选其一, 第一种不加版本号的安装, 会默认安装最新版本

**查看node版本:**

```shell
node -v
```

安装好node 就有了npm , npm是node包管理器

**用npm 安装nvim和yarn**

```shell
sudo npm i -g neovim yarn
```

以上命令安装的nvim和yarn, 都可以用其他包管理器安装, 例如Mac下的brew, Ubuntu下的apt, 以及centOS下的yum. 

## 安装插件管理器

coc.nvim 是通过 vim.plug 插件管理器来安装的, 所以必须先安装vim.plug

可以参考 [vim.plug][vimplug] 的官方文档进行安装

**neovim版本的vim.plug安装**

unix,linux:

``` shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Windows(PowerShell): 

``` shell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

**vim版本的vim.plug安装**

unix,linux:

``` shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows(PowerShell):

```shell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

## 安装coc.nvim

可以参考[coc.nvim][coc] 的官方文档进行安装

将以下代码添加到 vim.plug 的安装代码里

``` shell

Plug 'neoclide/coc.nvim', {'branch': 'release'}

```

在vim下执行`:PlugInstall` 命令, 即可进行安装



**验证coc.nvim服务状态**

在vim命令行模式输入以下命令:

``` vim
:checkhealth
```

通过以上命令打印出的结果中,  coc: health#coc#check 下的Environment check passed, Javascript bundle build/index.js found 和 Service started 都显示的是OK的状态, 那么coc.nvim 就可以正常运行了.

打印结果如下:

``` vim
coc: health#coc#check
========================================================================
  - OK: nvim version satisfied
  - OK: Environment check passed
  - WARNING: pyx command not work, some extensions may fail to work, checkout ":help |pythonx|"
  - WARNING: Install pynvim by command: pip install pynvim --upgrade
  - OK: Javascript bundle build/index.js found
  - OK: Service started
```

# coc.nvim 命令

安装插件命令


**安装扩展**

```
:CocInstall coc-xxxx
```

以上命令, `CocInstall` 后面跟着扩展的名字, 即可安装扩展

实例: 

```
:CocInstall coc-css
```

以上命令是安装 css 扩展的

```
:CocInstall coc-marketplace


```

以上命令是安装 coc 扩展商店的. 执行命令 `:CocList marketplace` 即可打开 扩展商城

```
:CocList marketplace keywords...
```

以上命令是通过关键词来查询有没有相关的扩展, `:CocList marketplace ` 后面跟着要查询的关键词. 用上下方向键选中你要安装的扩展, 按回车即可进行安装

**卸载扩展:**

```
:CocUninstall coc-css
```

以上命令为卸载命令. 卸载 `coc-css` 扩展, `:CocUninstall` 后面跟着要卸载的扩展

**查看已安装的扩展:**

```
:CocList extensions
```

以上命令是查看都安装了哪些扩展, 执行结果如下: 
```
* coc-marketplace 1.9.0 ~/.config/coc/extensions/node_modules/coc-marketplace
* coc-html 1.6.1 ~/.config/coc/extensions/node_modules/coc-html
* coc-spell-checker 1.2.0 ~/.config/coc/extensions/node_modules/coc-spell-checker
+ coc-css 1.3.0 ~/.config/coc/extensions/node_modules/coc-css
+ coc-sh 0.7.0 ~/.config/coc/extensions/node_modules/coc-sh
+ coc-vimlsp 0.12.8 ~/.config/coc/extensions/node_modules/coc-vimlsp
```

以上输出结果中, 扩展名前面的 `*` 号为已开启, `-` 号为未开启状态, 那是因为 coc 会检测不同的文件类型, 更具不同的文件开启相应的扩展. 可用上下方向键移动到相应的扩展, 按回车开启或关闭插件
<br>


# coc.nvim配置

**自动安装:**

```
let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-vimlsp',
        \ 'coc-marketplace',
        \ 'coc-markdownlint',
        \ 'coc-sh',
        \ 'coc-yaml',
        \ 'coc-tabnine',
        \ 'coc-java',
        \ 'coc-xml',
        \]
```

在 `.vim` 文件里加入以上代码. 打开 vim 时即可自动安装相应的扩展,(前提是你已经把 coc 和 node 安装好了)

**主要配置**

```
" 禁止备份, 开启备份影响一些补全的正常工作
set nobackup
set nowritebackup



" 让 vim 响应式更快
set updatetime=100

" 有用
set signcolumn=yes

" 开启 Tab 补全
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" 按回车确定补全, 而不是换行
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
```


<!--链接-->
[coc]:https://github.com/neoclide/coc.nvim
[vimplug]:https://github.com/junegunn/vim-plug
