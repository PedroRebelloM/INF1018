.section .text
.global boo

boo:
    pushq %rbp
    movq %rsp, %rbp

    subq $24, %rsp
    movl %rbx, -8(%rbp)
    movq %r12d, -12(%rbp)
    movq %r13d, -16(%rbp)
    movq %r14d, -20(%rbp)
    movq %r15d, -24(%rbp)

    movl %rdi, %rbx
    movq %esi, %r12d
    movq %rdx, %r13d
    movq $0, %r14d
    movq $0, %r15d



fim:
    movq -24(%rbp), %r15d
    movq -20(%rbp), %r14d
    movq -16(%rbp), %r13d
    movq -12(%rbp), %r12d
    movq -8(%rbp), %rbx

    leave
    ret


