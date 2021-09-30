"自写脚本管理器
"
"Create Time : 2021-09-30 by Edcwsyh

source ~/.vim/myscript/cpp_check.vim

let s:file_suffix = expand( "%:e" )
if Is_cpp_head_file( s:file_suffix ) || Is_cpp_source_file( s:file_suffix )
    source ~/.vim/myscript/open_h_cpp.vim
endif
