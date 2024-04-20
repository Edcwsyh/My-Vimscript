" vimscript
"> File Name : NameCovert.vim
"> Author : Edcwsyh
"> Create time : 2022年11月29日 星期二 14时21分15秒

"转化为蛇形命名
func g:ToSnakeCase(str)
    let line = substitute(a:str, '[a-z]\@<=[A-Z]', '_\1\0', 'g')
    return line
endfunc
