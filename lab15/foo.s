.section .text
.global foo

foo:
    pushq %rbp
    movq %rsp, %rbp

    cvtss2sd %xmm1, %xmm1
    movsd %xmm1, %xmm4
    addsd %xmm0, %xmm4

    movsd %xmm1, %xmm2
    subsd %xmm0, %xmm2
    mulsd %xmm2, %xmm4
    cvtsd2ss %xmm4, %xmm4
    movsd %xmm4, %xmm0
    leave
    ret