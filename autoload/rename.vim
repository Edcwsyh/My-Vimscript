" vimscript
"> File Name : rename.vim
"> Author : Edcwsyh
"> Create time : 2024年05月17日 星期五 10时38分50秒
"> Desc : 

" Replaces all occurrences of the second argument with the first argument
" If only one argument is provided, it uses the word under the cursor as the second argument
function! ReplaceText(...)
    let l:args = copy(a:000)
    if len(l:args) == 1
        let l:args += [expand('<cword>')]
    endif
    execute '%s/\V'.escape(l:args[1], '/\').'/'.escape(l:args[0], '/\').'/g'
endfunction

" Register the function as a command
command! -nargs=* -range=% Rename call ReplaceText(<f-args>)
