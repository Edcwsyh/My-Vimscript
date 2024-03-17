"自写脚本管理器
"
"Create Time : 2021-09-30 by Edcwsyh
 
" 获取当前脚本所在目录
let g:self_base#script_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 构建 autoload 目录路径
let g:self_base#autoload_dir = g:self_base#script_dir . '/autoload'

" pre autoload 目录, 相较于autoload预先加载的目录,
" 主要存放一些autoload依赖的组件
let g:self_base#pre_autoload_dir = g:self_base#script_dir . '/preautoload'

" 获取 autoload 目录下所有 .vim 文件
let s:pre_autoload_files = glob(g:self_base#pre_autoload_dir . '/*.vim', 0, 1)
let s:autoload_files = glob(g:self_base#autoload_dir . '/*.vim', 0, 1)

" 加载所有 pre_autoload 文件
for file in s:pre_autoload_files
    execute 'source' file
endfor

" 加载所有 autoload 文件
for file in s:autoload_files
    execute 'source' file
endfor

" xlcw 留个念想吧...
"call LoadScript("~/.vim/myscript/GenFromProtobuf.vim")
"call LoadScript("~/.vim/myscript/GenWarpper.vim")
"call LoadScript("~/.vim/myscript/best.vim")
