.section .text
.globl map2

map2:
    pushq %rbp
    movq  %rsp, %rbp

    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14

    movq  %rdi, %rbx
    movq  %rsi, %r12
    movl  %edx, %r14d
    xorl  %r13d, %r13d

loop:
    cmpl  %r14d, %r13d
    jge   fim

    movl  (%rbx, %r13, 4), %edi
    
    call  fim

    movl  %eax, (%r12, %r13, 4)

    incl  %r13d
    jmp   loop

fim:
    popq  %r14
    popq  %r13
    popq  %r12
    popq  %rbx

    leave
    ret