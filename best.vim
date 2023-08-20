" 项目根目录
function! GetThirdLevelDir()
  let current_dir = getcwd()
  let dir_list = split(current_dir, '/')
  if len(dir_list) >= 4
    let third_level_dir = join(dir_list[:2], '/')
    return third_level_dir
  endif
  return current_dir
endfunction

let g:project_root= "/".GetThirdLevelDir()."/"
" c++源文件目录
let g:cpp_src_dir=g:project_root."src/"
"协议目录
let g:protocol_dir=g:project_root."protocol/"

" 搜索某个进程目录下的标签
func s:Find_best_cpp_tag( progam_dir="**", tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:cpp_src_dir.a:progam_dir."/**/*.{cpp,h,hpp}  | copen" 
endfunc

" 搜索protobuf文件符号
func s:Find_best_protobuf_tag( tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:protocol_dir."{cs,ss,game_third,common,common_enum}/*.proto | copen"
endfunc

" 搜索bestdata.xml或cy_oss_log.xml文件符号
func s:Find_best_xml_tag( tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:protocol_dir."common/*.xml ".g:protocol_dir."database/*.xml ".g:protocol_dir."osslog/*.xml | copen"
endfunc

func s:Find_best_protobuf_database( tag=expand("<cword>") )
    exec "vimgrep /".a:tag."/j ".g:protocol_dir."database/*.proto | copen"
endfunc

command -nargs=* BestCppFind : call s:Find_best_cpp_tag(<f-args>)
command -nargs=? BestPBFind : call s:Find_best_protobuf_tag(<f-args>)
command -nargs=? BestXmlFind : call s:Find_best_xml_tag(<f-args>)
command -nargs=? BestDBFind : call s:Find_best_protobuf_database(<f-args>)
