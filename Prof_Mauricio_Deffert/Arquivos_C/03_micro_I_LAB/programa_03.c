//************************** BOT�O - 02 **************************
// Programa para testar os bot�es B0 e B1 e os LEDs D0 e D1
// Bot�o B0 liga LED D0, bot�o B1 liga LED D1
// PIC 16F877A, cristal de 8MHz
//****************************************************************


void main() {

  ADCON1 = 0b00000111;    // configura pinos de I/O como digital
  TRISD = 0b00000000;     // port D como sa�da
  PORTD = 0b00000000;     // port D inicia em n�vel LOW LEDs apagados
  TRISB = 0b00000011;     // port B pino RB0 e RB1 como entrada digital
  PORTB = 0b00000011;     // port B pino RB0 e RB1 com pull-up

  while(1){
  if(PORTB.RB0 == 0) PORTD.RD1 = 1; // se bot�o B0 pressionado, liga LED D1
  if(PORTB.RB1 == 0) PORTD.RD1 = 0; // se bot�o B1 pressionado, apaga LED D1
  PORTD.RD0 = ~PORTD.RD0;           // inverte estado do LED D0
  delay_ms(200);                    // aguarda 200ms
  }

}