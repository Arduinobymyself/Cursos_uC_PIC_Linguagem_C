#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_2.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_2.c"
unsigned char cont;


void main() {
 TRISD = 0;
 PORTD = 0;

 OPTION_REG = 0b10000111;
 TMR0 = 0;
 INTCON.TMR0IF = 0;

 while(1){
 if(INTCON.TMR0IF == 1){
 if(cont == 10){



 PORTD.RD0 = ~PORTD.RD0;
 cont = 0;
 }
 cont++;
 TMR0 = 0;
 INTCON.TMR0IF = 0;
 }
 }

}
