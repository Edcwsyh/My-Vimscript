" vimscript
"> File Name : GenFromProtobuf.vim
"> Author : Edcwsyh
"> Create time : 2022年05月23日 星期一 23时51分38秒
"> Desc : 
"           调用easycode.sh 生成消息ID到对应文件当中
"           需要保证easycode.sh被软链到可执行路径列表

let g:main_bufnr = 0

func s:Gen_enum( model="default" )
    let l:filename = expand( "%s" )
    let l:run_cmd = "easycode.sh enum ".l:filename." ".a:model." autoclose"
    echo "Run cmd : ".l:run_cmd
    let g:main_bufnr = bufnr('%')
    let buffer = term_start( l:run_cmd, { "term_finish" : "close" } )
    autocmd BufLeave <buffer> call MyFunction()
endfunc

function! MyFunction()
    execute g:main_bufnr."bufdo e!"
endfunction

command -nargs=? EnumGen : call s:Gen_enum(<f-args>)
