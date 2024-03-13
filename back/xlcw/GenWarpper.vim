" vimscript
"> File Name : GenWarpper.vim
"> Author : Edcwsyh
"> Create time : 2023年05月12日 星期五 18时53分30秒
func s:Generate_warpper( paramName, wapperName="NewWapper" )
    call append(line(".")-1, "    class ".a:wapperName." : public CSimpleWrapper<".a:paramName.">")
    call append(line(".")-1, "    {")
    call append(line(".")-1, "    public:")
    call append(line(".")-1, "        ")
    call append(line(".")-1, "    public:")
    call append(line(".")-1, "        ".a:wapperName."() {  }")
    call append(line(".")-1, "        virtual ~".a:wapperName."() {  }")
    call append(line(".")-1, "        virtual bool Check( ".a:paramName."& stParam) const { return true; }")
    call append(line(".")-1, "        virtual void DoSomething( ".a:paramName."& stParam) const {  }")
    call append(line(".")-1, "        virtual bool IsDoComplete( ".a:paramName."* pParam = NULL) const { return false; }")
    call append(line(".")-1, "        ")
    call append(line(".")-1, "    } stWrapper();")
endfunc

command -nargs=? Genwar : call s:Generate_warpper(<f-args>)
