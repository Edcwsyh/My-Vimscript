"若当前文件是头文件，则打开源文件
"若当前文件是源文件，则打开头文件
"否则，什么也不做
"
"Create Time : 2021-09-30 by Edcwsyh

func s:Translate_into_cpp_head( file_name )
    for suffix in g:cpp_head_list
        let open_file = a:file_name.".".suffix
        if filereadable( open_file )
            execute "vs ".open_file
            return
        endif
    endfor
    echo 'No corresponding cpp head file found!'
endfunc

func s:Translate_into_cpp_source( file_name )
    for suffix in g:cpp_source_list
        let open_file = a:file_name.".".suffix
        if filereadable( open_file )
            execute "vs ".open_file
            return
        endif
    endfor
    echo 'No corresponding cpp source file found!'
endfunc

func s:File_conversion()
    "0:未知文件，1：头文件，2：源文件
    let l:file_name = expand( "%:r" )
    let l:file_suffix = expand( "%:e" )
    if Is_cpp_head_file( l:file_suffix )
        call s:Translate_into_cpp_source( l:file_name )
        return
    elseif Is_cpp_source_file( l:file_suffix )
        call s:Translate_into_cpp_head( l:file_name )
        return
    endif
    echo 'This file is neither cpp header nor cpp_source! file name : ' + expand( "%" )
endfunc

command Cpc : call s:File_conversion()
