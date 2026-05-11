.data
.text
.global foo

foo:
    pushq %rbp
    movq %rsp, %rbp

    pushq %r12 // int n
    pushq %r13 // char c
    pushq %r14 // char * v 
    pushq %r15 // i
    pushq %rbx // soma

    movl %edi, %r12d // n
    movb %sil, %r13b // c
    movq %rdx, %r14 // v

    movq $0, %r15d // i
    movq $0, %ebx // s

L1:
    cmpl %r15d, %r12d
    je fim

    movb (%r14, %r15, 1), %al
    cmpb %r13b, %al
    jl  L2

    movb %al, %dil
    movb %r13b, %sil
    call gera

    addl %eax, %ebx
L2:
    addl $1, %r15d
    jmp L1


fim:
    movl %ebx, %eax

    popq %rbx
    popq %r15
    popq %r14
    popq %r13
    popq %r12

    leave
    ret
