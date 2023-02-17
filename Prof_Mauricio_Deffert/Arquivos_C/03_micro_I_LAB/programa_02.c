//************************** BOTÃO - 01 **************************
// Programa para controlar o LED ligado no pino RD0.
// Ao pressionar o botão B0 ligado ao pino RB0, o LED 0 apaga
// PIC 16F877A, cristal de 8MHz
//****************************************************************


void main() {

  ADCON1 = 0b00000111;    // configura pinos de I/O como digital
  TRISD = 0b00000000;     // port D como saída
  PORTD = 0b00000000;     // port D inicia em nível LOW LEDs apagados
  TRISB = 0b00000001;     // port B pino RB0 como entrada digital
  PORTB = 0b00000001;     // port B pino RB0 com pull-up

  while(1){

    if(PORTB.RB0 == 0){
      PORTD.RD0 = 1;  // liga LED 0
    } else{
      PORTD.RD0 = 0;  // desliga LED 0
    }

  }

}