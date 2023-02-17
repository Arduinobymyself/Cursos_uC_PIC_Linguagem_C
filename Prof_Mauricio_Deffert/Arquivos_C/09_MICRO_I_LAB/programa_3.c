/****************************** DISPLAY 7 SEG **********************************
 ****************************** CONTADOR 0 A 9 *********************************
  PORTD-> barramento: RD0=a, RD1=b, RD2=c, RD3=d, RD4=e, RD5=f, RD6=g e RD7=dp
  segmento desligado = 0; segmento ligado = 1
  PORTC -> controle dos displays: DISP1=RC4, DISP2=RC5
  display desligado = 0, display ligado = 1;
*******************************************************************************/

unsigned char num, cont, dezena, unidade;
unsigned char texto[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

void main() {
  ADCON1 = 7;
  TRISD = 0;
  PORTD = 0;
  TRISC = 0;
  PORTC = 0;

  while(1){

    // laço FOR utilizado para manter a varredura e gerar o tempo de 1 segundo
    for(cont = 0; cont < 100; cont++){
      dezena = num/10;
      PORTD = texto[dezena];
      PORTC.RC4 = 1; // habilita display 1
      delay_ms(5);
      PORTC.RC4 = 0;
      PORTD = 0;

      unidade = num%10;
      PORTD = texto[unidade];
      PORTC.RC5 = 1; // habilita display 2
      delay_ms(5);
      PORTC.RC5 = 0;
      PORTD = 0;

    }
    
    num++;
    
  }

}