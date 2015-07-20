" for folding stuff

setlocal foldmethod=expr   
setlocal foldexpr=GetPotionFold(v:lnum)

function! s:NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction


function! s:IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction


function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = s:IndentLevel(a:lnum)
    let next_indent = s:IndentLevel(s:NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        " the '>' makes it open the line number after it,
        " so '>1' makes it open/close line 1
        return '>' . next_indent
    endif
endfunction



