#include <stdio.h>

unsigned int inverteOrdemBytes(unsigned int i) {

    int mascara1 = 0x000000FF;
    int mascara2 = 0x0000FF00;
    int mascara3 = 0x00FF0000;
    int mascara4 = 0xFF000000;
    
    unsigned int byte1 = (i & mascara1) << 24;
    unsigned int byte2 = (i & mascara2) << 8;
    unsigned int byte3 = (i & mascara3) >> 8;
    unsigned int byte4 = (i & mascara4) >> 24;

    return byte1 | byte2 | byte3 | byte4;

}


int main(void) {

}