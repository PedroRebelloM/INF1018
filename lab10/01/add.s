.text
.globl add

add:
    pushq %rbp # salvo e aloco espaço para o ponteiro de base
    movq %rsp, %rbp # copio o que está no ponteiro variável para o ponteiro base 

    movl $0, %eax # certifico que estou zerando o ponteiro eax todas as vezes

L1:
    cmpq $0, %rdi # rdi é o registrador que guarda o valor recebido da função em c
    je L2 # pula para l2 se o valor for nulo

    addl (%rdi), %eax # adiciono o valor contido no registrador rdi que recebe o valor do programa em c para nosso registrador eax que seria nossa variável acumuladora
    movq 8(%rdi), %rdi # avanço 8 bytes para compreender o offset do struct e pegar o próximo ponteiro
    jmp L1
L2:
    leave
    ret

