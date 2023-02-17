#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_2.c"
#line 20 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_2.c"
int contador = 0;

void main() {
 TRISD = 0;
 PORTD = 0;

 OPTION_REG = 0b10000111;
 TMR0 = 0;
 INTCON.TMR0IF = 0;

 while(1){
 if(INTCON.TMR0IF == 1){
 if(contador == 20){
 PORTD.RD0 = ~PORTD.RD0;
 contador = 0;
 }
 contador++;
 TMR0 = 0;
 INTCON.TMR0IF = 0;
 }
 }
}
