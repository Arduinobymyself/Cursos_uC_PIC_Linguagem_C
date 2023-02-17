

// TESTANDO DEBUG NO MIKRO_C e no PROTEUS
// n�o esquecer de ativar a gera��o do arquivo .cof
// para poder simular no PROTEUS
// em  tools - options - output - generate cof

void main() {
  CMCON = 0X07;
  TRISA = 0b00000001;        // port A pino RA0 como entrada digital
  PORTA = 0b00000000;        // inicializa o port A em n�vel baixo
  TRISB = 0b00000000;        // port B como sa�da digital
  PORTB = 0b00000000;        // port B inicia em n�vel Low

  while(1){
    if(RA0_bit)
    {
      RB1_bit = 1;      // liga LED no pino RB1
      delay_ms(1000);    // aguada 500 milisegundos
      RB1_bit = 0;      // desliga LED no pino RB1
    }

  }


}