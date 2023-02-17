//************************ TESTE KIT DIDÁTICO ************************
// Testar todos os botões (B0 até B7), ligados no PORT B
// Testar todos os LEDs (L0 até L7), ligados no PORT D
// PIC 16F877A, cristal de 8MHz, Compilador MikroC PRO for PIC
//********************************************************************


void main() {
ADCON1 = 0b00000111;    // configura pinos de I/O como digital
TRISB = 0b11111111;     // configura port B como entrada digital
TRISD = 0b00000000;     // configura port D como saída digital
PORTB = 0b11111111;     // port B com pull-up
PORTD = 0b00000000;     // port D inicia em nível baixo (todos os LEDs apagados)

while(1){

  if(PORTB.RB0 == 0){ // se B0 pressionado, liga LED 0 caso ontrário desliga LED D0
    PORTD.RD0 = 1;
  } else {
    PORTD.RD0 = 0;
  }
  if(PORTB.RB1 == 0){
    PORTD.RD1 = 1;
  } else {
    PORTD.RD1 = 0;
  }
  if(PORTB.RB2 == 0){
    PORTD.RD2 = 1;
  } else {
    PORTD.RD2 = 0;
  }
  if(PORTB.RB3 == 0){
    PORTD.RD3 = 1;
  } else {
    PORTD.RD3 = 0;
  }
  if(PORTB.RB4 == 0){
    PORTD.RD4 = 1;
  } else {
    PORTD.RD4 = 0;
  }
  if(PORTB.RB5 == 0){
    PORTD.RD5 = 1;
  } else {
    PORTD.RD5 = 0;
  }
  if(PORTB.RB6 == 0){
    PORTD.RD6 = 1;
  } else {
    PORTD.RD6 = 0;
  }
  if(PORTB.RB7 == 0){
    PORTD.RD7 = 1;
  } else {
    PORTD.RD7 = 0;
  }
  
  delay_ms(50); // cancela o bouncing das chaves mecânicas
  
}

}