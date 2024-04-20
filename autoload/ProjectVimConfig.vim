" vimscript
"> File Name : ProjectVimConfig.vim
"> Author : Edcwsyh
"> Create time : 2024年04月20日 星期六 10时51分31秒
"> Desc : 

" 定义自动命令，当打开文件时加载项目特定配置
augroup ProjectConfig
    autocmd!
    autocmd VimEnter * call LoadProjectConfig()
augroup END

let s:config_file_name='.edc.vim'

function! LoadProjectConfig()
    let l:cur_dir=expand("%:p:h")
    if l:cur_dir ==# $HOME
        return
    endif
    let l:project_dir = FindProjectDirectory(l:cur_dir)
    if !empty(l:project_dir)
        let l:config_file = l:project_dir . '/'.s:config_file_name
        if filereadable(l:config_file)
            execute 'source ' . l:config_file
            return
        endif
    endif
endfunction

function! FindProjectDirectory(start_dir)
    let l:parent_dir = fnamemodify(a:start_dir, ':h')
    let l:config_file = a:start_dir. '/'.s:config_file_name
    if filereadable(l:config_file)
        return a:start_dir
    elseif l:parent_dir ==# $HOME
        return ''
    elseif l:parent_dir == '/'
        return ''
    else
        return FindProjectDirectory(l:parent_dir)
    endif
endfunction
