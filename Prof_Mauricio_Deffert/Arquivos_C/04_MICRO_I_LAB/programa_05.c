//************************ TESTE KIT DID�TICO ************************
// Testar o Rel�
// B0 liga o Rel�, B1 desliga
// PIC 16F877A, cristal de 8MHz, Compilador MikroC PRO for PIC
//********************************************************************


void main() {
ADCON1 = 0b00000111;    // configura pinos de I/O como digital
TRISB = 0b11111111;     // configura port B como entrada digital
TRISC = 0b00000000;     // configura port C como sa�da digital
PORTB = 0b11111111;     // port B com pull-up
PORTC = 0b00000000;     // port C inicia em n�vel baixo


while(1){
  if(PORTB.RB0 == 0){
    PORTC.RC3 = 1;
  }
  if(PORTB.RB1 == 0){
    PORTC.RC3 = 0;
  }
}

}