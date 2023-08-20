"生成C++类定义
"Create Time : 2021-12-06 by Edcwsyh
"Update Time : 2022-02-24 by Edcwsyh : 支持默认参数：文件名
"Update Time : 2022-04-03 by Edcwsyh : 修复生成的C++类模板代码复制构造函数和复制函数形参未加const关键字的问题
func s:Generate_cpp( className=expand("%:r") )
    let l:idx = 0
    call append(line(".")-1, "")
    call append(line(".")-1, "class ".a:className." {")
    call append(line(".")-1, "//Type")
    call append(line(".")-1, "public:")
    call append(line(".")-1, "    ")
    call append(line(".")-1, "//Constant")
    call append(line(".")-1, "public:")
    call append(line(".")-1, "protected:")
    call append(line(".")-1, "    ")
    call append(line(".")-1, "//Member Variables")
    call append(line(".")-1, "protected:")
    call append(line(".")-1, "    ")
    call append(line(".")-1, "//Static Member Variables")
    call append(line(".")-1, "protected:")
    call append(line(".")-1, "    ")
    call append(line(".")-1, "//Member Function")
    call append(line(".")-1, "public:")
    call append(line(".")-1, "    ".a:className."() = default;")
    call append(line(".")-1, "    explicit ".a:className."( const ".a:className."& ) = default;")
    call append(line(".")-1, "    explicit ".a:className."( ".a:className."&& ) = default;")
    call append(line(".")-1, "    ~".a:className."() = default;")
    call append(line(".")-1, "    ".a:className."& operator=( const ".a:className."& ) = default;")
    call append(line(".")-1, "    ".a:className."& operator=( ".a:className."&& ) = default;")
    call append(line(".")-1, "//Static Member Function")
    call append(line(".")-1, "public:")
    call append(line(".")-1, "    ")
    call append(line(".")-1, "};")
endfunc

command -nargs=? Gencpp : call s:Generate_cpp(<f-args>)
