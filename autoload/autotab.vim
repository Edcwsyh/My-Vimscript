" vimscript
"
" 检测文件中是否存在制表符

set expandtab

function! DetectTabs()
    let l:tabs_exist = search('^\t', 'nw') != 0
    if l:tabs_exist
        set noexpandtab
    else
        set expandtab
    endif
endfunction

" 在打开文件时自动执行 DetectTabs 函数
autocmd BufReadPost * call DetectTabs()

" 在保存文件时自动执行 DetectTabs 函数

autocmd BufWritePre * call DetectTabs()

" 在切换缓冲区时自动执行 DetectTabs 函数
autocmd BufEnter * call DetectTabs()
