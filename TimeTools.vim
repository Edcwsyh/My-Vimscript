"生成创建时间、更新时间

"Create Time : 2022年 04月 12日 星期二 21:55:48 CST

func s:Generate_time_str( prefix, user_prefix="" )
    call append(line(".") -1, "".a:user_prefix.a:prefix.strftime("%c") )
endfunc

command -nargs=? Icreatetime : call s:Generate_time_str( "Create Time : ", <f-args> )
command -nargs=? Iupdatetime : call s:Generate_time_str( "Update Time : ", <f-args> )
