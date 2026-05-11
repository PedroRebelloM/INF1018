#include <stdio.h>

unsigned int decod_short(short msg) {
    unsigned short operador = 1;
    unsigned short verificador  = msg >> 15;
    unsigned short mask1 = 0x000f;
    unsigned short mask2 = 0x00f0;
    unsigned short mask3 = 0x0f00;
    unsigned char nibble1 = msg & mask1;
    unsigned char nibble2 = (msg & mask2)>>4;
    unsigned short nibble3 = (msg & mask3)>>8;
    if((verificador & operador) == 0x0001)
        return nibble1 * nibble2 * nibble3;
    else
        return nibble1 + nibble2 + nibble3;

}