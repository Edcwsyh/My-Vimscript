" vimscript
"

function! GetUniqueValue()
    let max_value = -1
    let current_line = 1
    let last_line = line('$')

    while current_line <= last_line
        let line = getline(current_line)
        if line =~# '<macro'
            let value = substitute(line, '.*value="\([^"]*\)".*', '\1', '')
            if value =~? '^\d\+$'
                let max_value = max([max_value, str2nr(value)])
            endif
        endif
        let current_line += 1
    endwhile

    return max_value + 1
endfunction

function! GenerateIdAndMacro()
    let line = getline('.')
    if line =~# '<struct'
        " 处理 struct 标签
        let name = substitute(line, '.*name="\([^"]*\)".*', '\1', '')
        let desc = substitute(line, '.*desc="\([^"]*\)".*', '\1', '')
        let id = toupper(g:ToSnakeCase(name))
        if id =~? '^[A-Z][A-Z]'
            let id = id[:1] . '_CMD_' . id[2:]
        endif
        let new_line = substitute(line, 'id="\([^"]*\)"', 'id="' . id . '"', '')
        call setline('.', new_line)

        let unique_value = GetUniqueValue()
        " 插入 macro 标签
        let macro_line = '    <macro name="' . id . '" value="' . unique_value . '" desc="' . desc . '" />'
        call append(line('.') - 1, macro_line)
        let struct_end_line = '    </struct>'
        call append(line('.'), struct_end_line)
    else
        echohl WarningMsg
        echo "当前行不是 struct 标签"
        echohl None
    endif
endfunction

command -nargs=? Gxmlp : call GenerateIdAndMacro()