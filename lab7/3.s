/*
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    int i =0;
    while(i != 11) {
        printf("%d \n", i*i);
        i++;
    }
    return 0;
}
*/

.data
S2:    .int 1,2,3,4,5,6,7,8,9,10,0
Sf:  .string "%c"    /* primeira string de formato para printf */
Sf2: .string "\n"    /* segunda string de formato para printf */
Sf3: .string "%d\n"

.text
.globl  main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

  movq  $S2, %r12  /* r12 = &S2 */


L1:
  movl (%r12), %ebx
  cmpl  $0, (%r12)  /* if (*pc == 0) ? */
  je  L2/* goto L2 */

  movl %ebx, %eax
  imull %ebx, %eax

  /* eax = *r12 (estendendo o byte para 32 bits */

/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf3, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
  addq  $4, %r12  /* r12 += 1; */
  jmp   L1         /* goto L1; */
L2:  
/*************************************************************/
/* este trecho imprime o \n (estraga %eax)                  */
  movq  $Sf2, %rdi    /* primeiro parametro (ponteiro)*/
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/