


void main() {
  CMCON = 0X07;
  TRISB = 0b00000000;        // port B como saída digital
  PORTB = 0b00000000;        // port B inicia em nível Low

  while(1){
    RB1_bit = 0;      // liga LED no pino RB1
    delay_ms(100);    // aguada 500 milisegundos
    RB1_bit = 1;      // desliga LED no pino RB1
    delay_ms(100);    // aguada 500 milisegundos
  }


}