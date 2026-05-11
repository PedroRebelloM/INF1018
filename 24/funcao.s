.section .text
.global corta

corta:
    pushq %rbp // inicializo o registrador base
    movq %rsp, %rbp // movo os valores do registrador dinamico para o base

    movl %edi, %eax // o primeiro parâmetro da função é passado para o rdi, movo ele para o reg eax
    andl $0xFF, %eax // aplico a máscara para zerar os bits de sinal do char
    addl %esi, %eax // somo o valor de rsi, que seria o inteiro no registrador eax

    leave 
    ret


buba: 
    pushq %rbp // inicializo o registrador base
    movq %rsp, %rbp // movo os valores do registrador dinamico para o base

    pushq %rbx // inicializo o registrador que irá receber o valor contador 
    pushq %r12 // inicializo o registrador que irá receber a soma
    pushq %r13 // inicializo o registrador que irá receber o valor do registrador rds (int n)
    pushq %r14 // inicializo o registrador que irá receber o valor do registrador rdi (char *v)
    pushq %r15 // inicializo o registrador que irá receber o valor do registrador rdx ( char c)

    movq %rdi,%r14 // salvo o valor passado como primeiro parametro da função buba e corta
    movl %esi, %r13 // salvo o valor passado como segundo parâmetro da função buba e corta
    movb %dl, %r15b // o passo byte do caractere c recebido pelo rdx para os oito bits do r15
    movl $0, %ebx // zero o registrador que atuará como contador
    movl $0, %r12d // zero o registrador que atuará como acumulador da soma


loop:
    cmpl %r13d, %ebx // comparo se o contador é diferente do inteiro n (i<n)
    jl fimloop // pulo para o fim do loop se for

realLoop:
    movb  (%r14, %rbx, 1), %al  // avanço no vetor v o índice i e guardo no byte menos significativo de ebx ( V=r14, i=rbx)

    cmpb %r15b, %al // comparo o v[i] em r54b com o caractere  c, vejo se v[i] < c
    jg L1 // pulo a soma se for maior

    movsbl %al, %rdi // faço a limpeza de sinal do char para enviar ao primeiro parâmetro da função
    movl %r13d, %rsi // movo o inteiro n para o segundo parâmetro da função
    call corta // chamo a função corta

    addl %eax, %r12d // adiciono o valor retornado no registrador da soma

L1:
    addl $1, %ebx
    jmp loop

fimloop:
    movl  %r12d, %eax // retorno da buba em eax

    pop %r15 // desempilhando na ordem certa ( inversa ao push pq é uma pilha *LIFO)
    pop %r14
    pop %r13
    pop %r12
    pop %rbx

    leave 
    ret
    