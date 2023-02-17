#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_4.c"
#line 13 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_4.c"
void main() {
 TRISD = 0;
 PORTD = 0;
 TRISA.RA4 = 1;



 OPTION_REG = 0b10111000;
 TMR0 = 246;
 INTCON.TMR0IF = 0;

 while(1){
 PORTD = TMR0;
 if(INTCON.TMR0IF == 1){
 PORTD.RD0 = ~PORTD.RD0;
 TMR0 = 246;
 INTCON.TMR0IF = 0;
 }
 }
}
