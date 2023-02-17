//************************ TESTE KIT DIDÁTICO ************************
// Contagem Binárias nos LEDs do Port D
// PIC 16F877A, cristal de 8MHz, Compilador MikroC PRO for PIC
//********************************************************************


void main() {
ADCON1 = 0b00000111;    // configura pinos de I/O como digital
TRISD = 0b00000000;     // configura port D como saída digital
PORTD = 0b00000000;     // port D inicia em nível baixo

  while(1){
    PORTD++;
    delay_ms(300);
  }

}