/****************************** DISPLAY 7 SEG **********************************
 ****************************** CONTADOR 0 A 9 *********************************
  PORTD-> barramento: RD0=a, RD1=b, RD2=c, RD3=d, RD4=e, RD5=f, RD6=g e RD7=dp
  segmento desligado = 0; segmento ligado = 1
  PORTC -> controle dos displays: DISP1=RC4, DISP2=RC5
  display desligado = 0, display ligado = 1;
*******************************************************************************/

unsigned char indice = 0;
unsigned char texto[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

void main() {
  ADCON1 = 7;
  TRISD = 0;
  PORTD = 0;
  TRISC.RC4 = 0;
  PORTC.RC4 = 1; // liga display 1

  while(1){
    if(indice == 10) indice = 0;
    PORTD = texto[indice];
    delay_ms(1000);
    indice++;
  }

}