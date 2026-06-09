#include <stdio.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))
#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union { 
  float f;
  unsigned int i;
 } U;

float int2float(int i){
    if(i == 0) {
        return 0.0;
    }
    
    unsigned int sinal = 0;
    unsigned int valor = i;

    if(i<0) {
        sinal = 1;
        valor = -i;
    }

    int dividendo = valor;
    int bit = 0;
    while(dividendo > 1) {
        dividendo = dividendo >> 1;
        bit+=1;
    }

    unsigned int exp = 127 + bit;
    unsigned int frac = valor ^(1<<bit);

    if(bit <= 23) {
        frac = frac << (23-bit);
    } else {
        frac = frac>>(bit-23);
    }

    U u;
    u.i = (sinal<<31) | (exp<<23) | frac;
    return u.f;
}


int main() {
   int i;

   printf("\n******** int2float ****************\n");
   i = 0;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 1;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -1;  
   printf(" %d -> %10.4f\n", i, int2float(i));
   i = 0x7fffffff;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -i;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   return 0;
}