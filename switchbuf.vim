let g:switchbuf_enable=1

func s:Swichbuf_operate()
    if g:switchbuf_enable == 0
        let g:switchbuf_enable=1
    else
        set switchbuf=
        let g:switchbuf_enable=0
    endif
endfunc

if g:switchbuf_enable == 1
    set switchbuf=usetab,newtab
endif

command -nargs=0 Sbftab : call s:Swichbuf_operate()
