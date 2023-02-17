


void main() {
    CMCON = 7;       // desabilita os comparadores internos
    ANSEL = 0;       // sem conversores AD, somente portas digitais
    TRISIO0_bit = 0; // pino de IO 0 como saída
    TRISIO1_bit = 0; // pino de IO 1 como saída
    
    GPIO = 0;
    
    while(1){
        GPIO.F0 = 1;
        GPIO.F1 = 0;
        delay_ms(200);
        GPIO.F0 = 0;
        GPIO.F1 = 1;
        delay_ms(200);
    }
}