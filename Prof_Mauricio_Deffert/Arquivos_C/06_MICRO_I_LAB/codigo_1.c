



void main() {

  ADCON1 = 7;           // desabilita comparadores internos
  TRISD = 0;            // port D omo saída
  PORTD = 0;            // port D inicia em LOW
  TRISB.RB0 = 1;        // port B RB0 como entrada
  PORTB.RB0 = 1;        // port B RB0 com pull-up

  while(1){

    if(PORTB.RB0 == 0){
      PORTD.RD0 = 1;
      PORTD.RD0 = 0;
      delay_ms(10);
    }
    if(PORTB.RB1 == 0){
      PORTD.RD1 = 1;
    } else {
      PORTD.RD1 = 0;
      delay_ms(10);
    }

  }

}