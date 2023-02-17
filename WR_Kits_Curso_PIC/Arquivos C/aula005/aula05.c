

// TRABALHANDO COM POOLING
// o tentar simular dois osciladores, n�o temos a resposta requerida

void main() {
    ANSEL = 0; // sem conversores A/D somente portas digitais
    CMCON = 7; // desabilita os comparadores internos
    TRISIO0_bit = 0; // pino de I/O 0 como sa�da
    TRISIO1_bit = 0; // pino de I/O 1 como sa�da
    
    GPIO = 0; // GPIO inicia em n�vel baixo

    while(1){
        // pulsa em 50Hz, duty 50%
        gpio.f0 = 1;
        delay_ms(10);
        gpio.f0 = 0;
        delay_ms(10);
        
        // pulsa em 500Hz. duty 50%
        gpio.f1 = 1;
        delay_ms(1);
        gpio.f1 = 0;
        delay_ms(1);
    }

}