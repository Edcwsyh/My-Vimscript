"自写脚本管理器
"
"Create Time : 2021-09-30 by Edcwsyh

function LoadScript(FileName)
    if filereadable( expand(a:FileName) )
        source ~/.vim/myscript/local.vim
    endif
endfunction


"C++ 文件判断
call LoadScript("~/.vim/myscript/cpp_check.vim")
"时间工具
call LoadScript("~/.vim/myscript/TimeTools.vim")

"在头文件中打开源文件
call LoadScript("~/.vim/myscript/open_h_cpp.vim")
"生成c++类
call LoadScript("~/.vim/myscript/generate_cpp.vim")


call LoadScript("~/.vim/myscript/FileSuffixMgr.vim")
call LoadScript("~/.vim/myscript/Line.vim")
" 本地差异化内容文件
call LoadScript("~/.vim/myscript/local.vim")


" xlcw 留个念想吧...
"call LoadScript("~/.vim/myscript/GenFromProtobuf.vim")
"call LoadScript("~/.vim/myscript/GenWarpper.vim")
"call LoadScript("~/.vim/myscript/best.vim")
