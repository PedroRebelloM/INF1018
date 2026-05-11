.section .text
.globl add2

add2:
    pushq %rbp
    movq  %rsp, %rbp

    cmpq  $0, %rdi
    jne   .recursao

    movl  $0, %eax
    jmp   .fim

.recursao:
    pushq %rbx
    movl  (%rdi), %ebx

    movq  8(%rdi), %rdi
    
    call  add2

    addl  %ebx, %eax
    
    popq  %rbx

.fim:
    leave
    ret