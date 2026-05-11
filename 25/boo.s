.section .text
.global boo

boo:
    pushq %rbp
    movq %rsp, %rbp

    pushq %rbx // int * v
    pushq %r12 // int n
    pushq %r13 // int ref
    pushq %r14 // int i
    pushq %r15 // int contador

    movq %rdi, %rbx
    movl %esi, %r12d
    movl %edx, %r13d
    movl $0, %r14d
    movl $0, %r15d

loop:
    cmpl %r14d, %r12d // r12d - r14d
    je fim 

    movl (%rbx, %r14d, $4), %edi
    movl %r13d, %edx
    call maior_que

    cmpl $1, %eax
    jne iteracao
    
    addl $1, %r15d

iteracao:
    addl $1, %r14d
    jmp loop 


fim:
    movl %r15d, %eax

    popq %r15
    popq %r14
    popq %r13
    popq %r12 
    popq %rbx
    leave ret


