" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------
nmap <Leader>mt :MakeTitle<CR>



" ------------------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------------------

" Takes the current line and puts a nice box around it
function! MakeTitle()
    exec "normal O\<Esc>78a-\<Esc>"
    exec "normal jo\<Esc>78a-\<Esc>"
    -2,.s/^/" /g
endfunction
command! MakeTitle call MakeTitle()

