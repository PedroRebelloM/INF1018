#include <stdio.h>
#include <math.h> 

float foo1(float a, float b);

int main() {
    float x = 1.0;
    float y = 5.0;
    
    float resultado = foo1(x, y);
    
    printf("Resultado de foo1(%.2f, %.2f): %.2f\n", x, y, resultado);
    
    return 0;
}
