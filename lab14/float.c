#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))
#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union { 
  float f;
  unsigned int i;
 } U;
U u;
float f1 = 55.32;
unsigned int u1;

float float2(float f) {
    U u;
    u.f = f;
    int signal = getsig(u.i);
    int mantissa = getexp(u.i);
    int frac = getfrac(u.i);
    mantissa += 1;

    signal = signal << 31;
    mantissa = mantissa << 23;

    u.i = signal | mantissa | frac;
    return u.f;

}

