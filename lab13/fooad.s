.section .text
.global foo

foo:
    pushq %rbp
    movq %rsp, %rbp

    call add

    leave
    ret