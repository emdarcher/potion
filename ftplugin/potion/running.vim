" code for using external commands

" checks to see if global variable potion_command exists
" this lets a user define it to a different path or command 
" in their personal .vimrc file.
if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

nnoremap <buffer> <LocalLeader>r :call PotionCompileAndRunFile()<cr>

function! PotionShowBytecode()
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    " Open a new split and set it up
    vsplit __Potion_Bytecode__
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))

endfunction

nnoremap <buffer> <LocalLeader>b :call PotionShowBytecode()<cr>


