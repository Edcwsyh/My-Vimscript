"检测一个文件是否是C/C++文件
"
" Create Time : 2021-09-30 by Edcwsyh
" 

let g:cpp_head_list = [ "h", "hpp" ]
let g:cpp_source_list = [ "c", "cpp", "cxx", "cc" ]

func Is_cpp_head_file( str )
    for cpp_head_file in g:cpp_head_list
        if a:str == cpp_head_file
            return 1
        endif
    endfo
    return 0
endfunc

func Is_cpp_source_file( str )
    for cpp_source_file in g:cpp_source_list
        if a:str == cpp_source_file
            return 1
        endif
    endfo
    return 0
endfunc
