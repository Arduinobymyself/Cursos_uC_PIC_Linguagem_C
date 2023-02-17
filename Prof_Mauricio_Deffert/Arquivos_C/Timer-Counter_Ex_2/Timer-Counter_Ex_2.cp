#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_Ex_2.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_Ex_2.c"
void interrupt();


void main() {
 ADCON1 = 7;
 TRISD = 0;
 PORTD = 0;
 TRISB.RB0 = 1;
 PORTB.RB0 = 1;
 TRISA.RA4 = 1;


 PORTA.RA4 = 1;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;


 OPTION_REG = 0b10111000;
 TMR0 = 246;
 INTCON.TMR0IF = 0;

 while(1){
 if(PORTB.RB0 == 0){
 TMR0 = 246;
 INTCON.TMR0IF = 0;
 PORTD.RD0 = 0;
 }
 }
}

void interrupt(){
 if(INTCON.TMR0IF == 1){
 PORTD.RD0 = 1;
 INTCON.TMR0IF = 0;
 }
}
