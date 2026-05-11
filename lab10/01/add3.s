.section .text
.globl boo

boo:
    pushq %rbp
    movq  %rsp, %rbp

    pushq %rbx
    pushq %r12
    pushq %r13

    movq  %rdi, %rbx
    movl  %esi, %r12d
    movl  %edx, %r13d

loop:
    movl  %r12d, %eax
    decl  %r12d
    testl %eax, %eax
    jz    fim

    movl  (%rbx), %edi
    movl  %r13d, %esi
    
    call  f

    movl  %eax, 4(%rbx)

    addq  $8, %rbx
    
    jmp   loop

fim:
    popq  %r13
    popq  %r12
    popq  %rbx
    leave
    ret