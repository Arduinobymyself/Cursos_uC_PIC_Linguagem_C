//************************** BOT�O - 04 **************************
// Programa para testar o bot�o B0 no modo trava tecla e acender o LED D0
// PIC 16F877A, cristal de 8MHz
//****************************************************************


void main() {

  ADCON1 = 0b00000111;    // configura pinos de I/O como digital
  TRISD = 0b00000000;     // port D como sa�da
  PORTD = 0b00000000;     // port D inicia em n�vel LOW LEDs apagados
  TRISB = 0b00000001;     // port B pino RB0 como entrada digital
  PORTB = 0b00000001;     // port B pino RB0 com pull-up
  
  // int flag = 0;           // sinaliza o estado do bot�o B0

  while(1){
    int flag = 0;           // sinaliza o estado do bot�o B0
    if(PORTB.RB0 == 0){ // se bot�o B0 pressionado
      delay_ms(30);     // delay para debouncing do bot�o

      if(flag == 0){
        PORTD.RD0 = ~PORTD.RD0; // inverte estado do LED D0
        flag = 1;               // sinaliza flag de estado do bot�o (pressionado)
      } else {
        flag = 0;               // reincializa o flag
      }

    }

  }

}