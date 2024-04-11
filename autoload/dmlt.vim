" 项目根目录
function! s:GetProjectRootDir()
    let l:dir = getcwd()
    while 1
        if filereadable(l:dir . "/svr.sh") || isdirectory(l:dir . "/svr.sh")
            return l:dir
        endif
        let l:parent = fnamemodify(l:dir, ":h")
        if l:parent == l:dir
            return ""
        endif
        let l:dir = l:parent
    endwhile
endfunction

let g:project_root=s:GetProjectRootDir()."/"

" 搜索代码中的符号
func s:FindDmSrcSymbol( tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:project_root."src"."/**/*.{cpp,h,hpp,cc}  | copen" 
endfunc

" 搜索xml符号
func s:FindDmXmlSymbol( tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:protocol_dir."{protocol/xml,resource/xml}/*.xml | copen"
endfunc

" 搜索所有符号
func s:FindDmAllSymbol( tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:protocol_dir."{protocol/xml,resource/xml,src}/**/*.{cpp,h,hpp,cc,xml} | copen"
endfunc

"func s:Find_best_protobuf_database( tag=expand("<cword>") )
"    exec "vimgrep /".a:tag."/j ".g:protocol_dir."database/*.proto | copen"
"endfunc

command -nargs=? Dmsrc : call s:FindDmSrcSymbol(<f-args>)
command -nargs=? Dmxml : call s:FindDmXmlSymbol(<f-args>)
command -nargs=? Dmall : call s:FindDmAllSymbol(<f-args>)
"command -nargs=? BestDBFind : call s:Find_best_protobuf_database(<f-args>)
