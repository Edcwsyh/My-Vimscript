"自写脚本管理器
"
"Create Time : 2021-09-30 by Edcwsyh

"C++ 文件判断
source ~/.vim/myscript/cpp_check.vim 
"时间工具
source ~/.vim/myscript/TimeTools.vim

let s:file_suffix = expand( "%:e" )
if Is_cpp_head_file( s:file_suffix ) || Is_cpp_source_file( s:file_suffix )
    "在头文件中打开源文件
    source ~/.vim/myscript/open_h_cpp.vim
    "生成c++类
    source ~/.vim/myscript/generate_cpp.vim
endif

if s:file_suffix == "proto"
    source ~/.vim/myscript/GenFromProtobuf.vim
endif

source ~/.vim/myscript/FileSuffixMgr.vim
