let function_list = {
    \ 'hpp' : "HandleHpp()", 
    \ 'h'   : "HandleH()", 
    \ 'cpp' : "HandleCpp()", 
    \ 'cxx' : "HandleCpp()", 
    \ 'cc'  : "HandleCpp()", 
    \ 'c'   : "HandleC()", 
    \ 'py'  : "HandlePython()", 
    \ 'sh'  : "HandleSh()", 
    \ 'vim' : "HandleVim()", 
\}

func GetBaseInfo()
    let BaseInfo = [
        \ '> File Name : '.expand("%:t"), 
        \ '> Author : Edcwsyh', 
        \ '> Create time : '.strftime("%c"), 
        \ '> Desc : '
    \]
    return BaseInfo
endfunc

func HandleCpp()
    let BaseInfo = GetBaseInfo()
    call append(line("$")-1, "/******************************************************")
    for str in BaseInfo
        call append(line("$")-1, "  ".str)
    endfor
    call append(line("$")-1, "*******************************************************/")
    call append(line("$")-1, "")
endfunc

func HandleC()
    let BaseInfo = GetBaseInfo()
    call append(line("$")-1, "/******************************************************")
    for str in BaseInfo
        call append(line("$")-1, "  ".str)
    endfor
    call append(line("$")-1, "*******************************************************/")
    call append(line("$")-1, "")
endfunc

func HandleH()
    let head_macro = ToSnakeCase( expand("%:t:r") ).'_H__'
    let BaseInfo = GetBaseInfo()
    call append(line("$")-1, "/******************************************************")
    for str in BaseInfo
        call append(line("$")-1, "  ".str)
    endfor
    call append(line("$")-1, "*******************************************************/")
    call append(line("$")-1, "")
    call append(line("$")-1, "#ifndef __".toupper(head_macro))
    call append(line("$")-1, "#define __".toupper(head_macro))
    call append(line("$")-1, "")
    call append(line("$")-1, "")
    call append(line("$")-1, "#endif")
endfunc

func HandleHpp()
    let head_macro = ToSnakeCase( expand("%:t:r") ).'_HPP__'
    let BaseInfo = GetBaseInfo()
    call append(line("$")-1, "/******************************************************")
    for str in BaseInfo
        call append(line("$")-1, "  ".str)
    endfor
    call append(line("$")-1, "*******************************************************/")
    call append(line("$")-1, "")
    call append(line("$")-1, "#ifndef __".toupper(head_macro))
    call append(line("$")-1, "#define __".toupper(head_macro))
    call append(line("$")-1, "")
    call append(line("$")-1, "namespace {")
    call append(line("$")-1, "")
    call append(line("$")-1, "}")
    call append(line("$")-1, "")
    call append(line("$")-1, "#endif")
endfunc

func HandlePython()
    call append(line("$")-1, "#!/usr/bin/env python3")
    call append(line("$")-1, "# coding=utf-8")
    call append(line("$")-1, "")
    let BaseInfo = GetBaseInfo()
    for str in BaseInfo
        call append(line("$")-1, "# ".str)
    endfor
    call append(line("$")-1, "")
endfunc

func HandleSh()
    call append(line("$")-1,"\#!/bin/bash") 
    call append(line("$")-1, "")
    let BaseInfo = GetBaseInfo()
    for str in BaseInfo
        call append(line("$")-1, "# ".str)
    endfor
    call append(line("$")-1, "")
endfunc

func HandleVim()
    call append(line("$")-1, "\" vimscript")
    let BaseInfo = GetBaseInfo()
    for str in BaseInfo
        call append(line("$")-1, "\"".str)
    endfor
endfunc

func s:SuffixHandle( suffix=expand('%:e') )
    let l:function = get(g:function_list, a:suffix, 'null')
    if function == 'null'
        return 0
    endif
    let l:cmd = ":call ".l:function
    exec l:cmd
endfunc

autocmd BufNewFile * exec ":call s:SuffixHandle(expand(\"%:e\"))"
autocmd BufNewfile * normal G

command -nargs=? FileHeadGen : call s:SuffixHandle(<f-args>)
