#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula039_Timer1_Contador.c"



void interrupt();

void main() {

 TRISC = 0b00000001;
 PORTC = 0b00000001;
 TRISD = 0;
 PORTD = 0;





 T1CON = 0b00000011;
 TMR1H = 0xFF;
 TMR1L = 0xFE;


 INTCON = 0b11000000;

 PIE1 = 0b00000001;
 PIR1 = 0b00000000;


 while(1){

 }

}

void interrupt(){

 if(PIR1.TMR1IF){
 PIR1.TMR1IF = 0;
 TMR1H = 0xFF;
 TMR1L = 0xFE;
 RD7_bit = ~RD7_bit;
 }

}
