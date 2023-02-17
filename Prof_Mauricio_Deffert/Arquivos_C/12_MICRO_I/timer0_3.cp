#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_3.c"
#line 23 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I/timer0_3.c"
void interrupt();


unsigned int cont = 0;
unsigned int tempo = 1000;


void main() {

 ADCON1 = 7;
 CMCON = 7;

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.TMR0IE = 1;

 TRISD = 0;
 PORTD = 0;

 OPTION_REG = 0b10000010;
 TMR0 = 6;



 INTCON.TMR0IF = 0;

 while(1){

 if(cont == tempo){



 PORTD.RD0 = ~PORTD.RD0;
 cont = 0;
 }

 }

}


void interrupt(){
 cont++;
 TMR0 = 6;

 INTCON.TMR0IF = 0;
}
