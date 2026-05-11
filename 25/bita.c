int bitMaisADireita(unsigned int numero) {
    unsigned int verificador = 2;
    int contador = 1;
    int i = 0;
    while(i<31) {
        if(verificador & numero) {
            return contador;
        } else {
            verificador = (verificador << 1);
            contador += 1;
            i+=1;
        }
    }
    return -1;
}