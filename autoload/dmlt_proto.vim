" vimscript
"> File Name : GenFromProtobuf.vim
"> Author : Edcwsyh
"> Create time : 2022年05月23日 星期一 23时51分38秒
"> Desc : 
"           调用easycode.sh enum解析.proto生成消息ID到cs/ss_enum.proto中
"           需要保证easycode.sh被软链到可执行路径列表
"           由于easycode.sh会先revert enum.proto, 因此不能多个文件分别调用

let g:main_bufnr = 0
let g:dmlt_union_generator=""

func s:Gen_enum()
    let l:filename = expand("%:p")
    let l:run_cmd = g:dmlt_union_generator . " " . l:filename
    echo "Run cmd: " . l:run_cmd
    let g:main_bufnr = bufnr('%')
    " Start the terminal and keep the window open
    echo "Run cmd: " . l:run_cmd
    let buffer = term_start( l:run_cmd, { "term_finish" : "open" } )

endfunc

command -nargs=? EnumGen : call s:Gen_enum()

