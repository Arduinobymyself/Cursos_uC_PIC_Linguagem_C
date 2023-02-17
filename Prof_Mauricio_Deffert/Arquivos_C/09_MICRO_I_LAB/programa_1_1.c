/***************************** DISPLAY 7 SEG *********************************
 ************************** TESTE MULTIPLEXAÇÃO ******************************
  PORTD-> barramento: RD0=a, RD1=b, RD2=c, RD3=d, RD4=e, RD5=f, RD6=g e RD7=dp
  segmento desligado = 0; segmento ligado = 1
  PORTC -> controle dos displays: DISP1=RC4, DISP2=RC5
  display desligado = 0, display ligado = 1;
*****************************************************************************/


void main() {
  ADCON1 = 7;
  TRISD = 0;
  PORTD = 0;
  TRISC = 0;
  PORTC = 0;
  
  while(1){
    PORTD = 79;
    PORTC.RC4 = 1;
    delay_ms(10);
    PORTC.RC4 = 0;
    
    PORTD =  109;
    PORTC.RC5 = 1;
    delay_ms(10);
    PORTC.RC5 = 0;
  }
  
}