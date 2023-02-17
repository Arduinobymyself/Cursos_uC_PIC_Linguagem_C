

// TESTANDO DEBUG NO MIKRO_C e no PROTEUS
// não esquecer de ativar a geração do arquivo .cof
// para poder simular no PROTEUS
// em  tools - options - output - generate cof

void main() {
  CMCON = 0X07;
  TRISA = 0b00000001;        // port A pino RA0 como entrada digital
  PORTA = 0b00000000;        // inicializa o port A em nível baixo
  TRISB = 0b00000000;        // port B como saída digital
  PORTB = 0b00000000;        // port B inicia em nível Low

  while(1){
    if(RA0_bit)
    {
      RB1_bit = 1;      // liga LED no pino RB1
      delay_ms(1000);    // aguada 500 milisegundos
      RB1_bit = 0;      // desliga LED no pino RB1
    }

  }


}