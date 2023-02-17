#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_1.c"
#line 27 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_1.c"
void main() {
 TRISD = 0;
 PORTD = 0;

 OPTION_REG = 0b10000111;
 TMR0 = 0;
 INTCON.TMR0IF = 0;

 while(1){
 if(INTCON.TMR0IF == 1){
 PORTD.RD0 = ~PORTD.RD0;
 TMR0 = 0;
 INTCON.TMR0IF = 0;
 }
 }

}
