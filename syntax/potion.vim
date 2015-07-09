
if exists("b:current_syntax")
    finish
endif

" Keywords {{{
syntax keyword potionKeyword to times while loop
syntax keyword potionKeyword if elsif else 
syntax keyword potionKeyword class return 

highlight link potionKeyword Keyword

" }}}

" Functions {{{
syntax keyword potionFunction print join string

highlight link potionFunction Function

" }}}


" Comments {{{
syntax match potionComment "\v#.*$"
highlight link potionComment Comment
" }}}

" Operators {{{

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

highlight link potionOperator Operator

" }}}

" Numbers {{{
" number
syntax match potionNumber "\v\d+"
" hex
syntax match potionNumber "\v0x\x+"
" floats
syntax match potionNumber "\v\d+e[\+-]\d+"
syntax match potionNumber "\v\d+\.=\d+"
syntax match potionNumber "\v\d+\.=\d+e[\+-]\d+"

highlight link potionNumber Number
" }}}

" Strings {{{

" double quoted 
syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
" single quoted
syntax region potionString start=/\v'/ skip=/\v''/ end=/\v'/

highlight link potionString String
" }}}

let b:current_syntax = "potion"


