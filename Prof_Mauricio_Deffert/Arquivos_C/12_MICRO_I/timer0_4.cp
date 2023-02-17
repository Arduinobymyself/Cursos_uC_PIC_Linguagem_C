#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_4.c"
#line 22 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_4.c"
char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};


void main() {

 ADCON1 = 7;
 CMCON = 7;

 TRISA.RA4 = 1;


 TRISD = 0;
 PORTD = 0;
 TRISC.RC4 = 0;
 PORTC.RC4 = 1;


 OPTION_REG = 0b10111000;
 TMR0 = 246;


 INTCON.TMR0IF = 0;

 while(1){

 PORTD = digitos[(10 - (256 - TMR0))];


 if(INTCON.TMR0IF == 1){

 TMR0 = 246;
 INTCON.TMR0IF = 0;
 }

 }

}
