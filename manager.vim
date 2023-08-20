"自写脚本管理器
"
"Create Time : 2021-09-30 by Edcwsyh

"C++ 文件判断
source ~/.vim/myscript/cpp_check.vim 
"时间工具
source ~/.vim/myscript/TimeTools.vim

"在头文件中打开源文件
source ~/.vim/myscript/open_h_cpp.vim
"生成c++类
source ~/.vim/myscript/generate_cpp.vim
source ~/.vim/myscript/GenWarpper.vim

source ~/.vim/myscript/GenFromProtobuf.vim

source ~/.vim/myscript/best.vim
source ~/.vim/myscript/switchbuf.vim
source ~/.vim/myscript/FileSuffixMgr.vim
source ~/.vim/myscript/Line.vim

"本地差异化内容文件
if filereadable( expand('~/.vim/myscript/local.vim') )
    source ~/.vim/myscript/local.vim
endif

