/*
        CONVERSOR A/D - EXEMPLO 3
        Leitura do canal anal�gico AN0(RA0)
        ADREASH e ADRESL - 10 bits
        Sinalizado por 8 LEDs no PORT B e 2 LEDs no PORT C
*/

unsigned int leituraAD1, leituraAD2;

void main() {

  TRISB = 0b00000000;           // PORT B como sa�da
  PORTB = 0b00000000;           // LEDs apagados
  TRISC = 0b00000000;           // PORT C como sa�da
  PORTC = 0b00000000;           // LEDs apagados
  TRISD = 0b00000000;           // PORT D como sa�da
  PORTD = 0b00000000;           // LEDs apagados
  
  TRISA.RA0 = 1;                // AN0(RA0) configurado como entrada

  while(1){
    leituraAD1 = ADC_Read(0) / 4; // l� AN0(RA0) - salva na vari�vel
                                  // divis�o por 4 para trasnformar de 10 para 8 bits
    PORTD = leituraAD1;           // carrega resultado no PORT D
    
    leituraAD2 = ADC_Read(0);     // l� AN0(RA0) - salva na vari�vel
    PORTB = leituraAD2;           // carrega 8 bits LSB no PORT B
    PORTC = leituraAD2 >> 8;      // carrega 2 bits MSB em RC1 e RC0
  }

}