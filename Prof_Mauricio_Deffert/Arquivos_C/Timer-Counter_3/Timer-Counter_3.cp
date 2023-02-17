#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_3.c"
#line 19 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_3.c"
void interrupt();

unsigned int contador = 0;

void main() {
 TRISD = 0;
 PORTD = 0;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;

 TMR0 = 6;

 OPTION_REG = 0b10000010;



 while(1){
 if(contador == 1000){
 PORTD.RD0 = ~PORTD.RD0;
 contador = 0;
 }
 }
}

void interrupt(){
 contador++;
 TMR0 = 6;
 INTCON.TMR0IF = 0;
}
