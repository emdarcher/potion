" code for using external commands

" checks to see if global variable potion_command exists
" this lets a user define it to a different path or command 
" in their personal .vimrc file.
if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

"function! PotionCompileAndRunFile()
"    " save file before compilation
"    execute "w"
"    silent !clear
"    execute "!" . g:potion_command . " " . bufname("%")
"endfunction
"
"nnoremap <buffer> <LocalLeader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <LocalLeader>r
            \ :call potion#running#PotionCompileAndRunFile()<cr>

"function! PotionShowBytecode()
"    " save file
"    execute "w"
"    " Get the bytecode.
"    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))
"   
"    " check if there was a shell error 
"    if v:shell_error
"        echoerr bytecode
"    else
"        " Check to see if bytecode buffer already exists
"        if bufwinnr("__Potion_Bytecode__") >= 0 
"            " if it already exists, switch to that window
"            execute  bufwinnr("__Potion_Bytecode__")  . "wincmd w"
"        else
"
"            " Open a new split and set it up
"            vsplit __Potion_Bytecode__
"            normal! ggdG
"            setlocal filetype=potionbytecode
"            setlocal buftype=nofile
"
"            " Insert the bytecode.
"            call append(0, split(bytecode, '\v\n'))
"        endif
"    endif
"
"endfunction
"
"nnoremap <buffer> <LocalLeader>b :call PotionShowBytecode()<cr>
nnoremap <buffer> <LocalLeader>b
            \ :call potion#running#PotionShowBytecode()<cr>


