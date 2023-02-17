#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula040_Timer1_Com_Cristal.c"



void interrupt();

void main() {

 TRISC = 0b00000010;

 TRISD = 0;
 PORTD = 0;





 T1CON = 0b00001011;
 TMR1H = 0x80;
 TMR1L = 0x00;


 INTCON = 0b11000000;

 PIE1 = 0b00000001;
 PIR1 = 0b00000000;


 while(1){

 }

}

void interrupt(){

 if(PIR1.TMR1IF){
 PIR1.TMR1IF = 0;
 TMR1H = 0x80;
 TMR1L = 0x00;
 RD7_bit = ~RD7_bit;
 }

}
