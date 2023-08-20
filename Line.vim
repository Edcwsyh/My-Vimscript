" vimscript
"> File Name : Line.vim
"> Author : Edcwsyh
"> Create time : 2023年08月16日 星期三 00时26分49秒

augroup relative_numbser
 autocmd!
 autocmd InsertEnter * :set norelativenumber
 autocmd InsertLeave * :set relativenumber
augroup END
