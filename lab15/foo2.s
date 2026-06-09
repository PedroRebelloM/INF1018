.section .text
global foo2, sin, cos

foo2: 
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    movss %xmm1, -4(%rbp)
    call sin
    movss %xmm0, -8(%rbp)
    movss -4(%rbp), %xmm0
    call cos
    adds -8(%rbp), %xmm0

    leave
    ret
