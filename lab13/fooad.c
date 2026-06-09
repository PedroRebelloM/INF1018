#include <stdio.h>

typedef int(*funcp)(int);

// 1. Mudamos para o topo para evitar o warning de declaração implícita
int add (int x) {
    return x + 1;
}

int foo (int x) {
    return add(x);
}

int main(void) {
    unsigned char codigo[] = {
        0x55, 0x48, 0x89, 0xe5, 0xe8, 0x00, 0x00, 0x00, 0x00, 0xc9, 0xc3
    };
    
    long destino = (long)&add;
    
    long prox = (long)&codigo[9]; 
    
    int deslocamento = (int)(destino - prox);
    
    *(int *)&codigo[5] = deslocamento;
    
    funcp f = (funcp)codigo;
    int i = (*f)(10); 
    
    printf("Resultado: %d\n", i); 
    return 0;
}