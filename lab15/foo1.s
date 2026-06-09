.section text
.global foo1

foo1:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    
    movss %xmm1, -4(%rbp)
    call sin
    movss -4(%rbp), %xmm1
    addss %xmm1, %xmm0
    leave
    ret