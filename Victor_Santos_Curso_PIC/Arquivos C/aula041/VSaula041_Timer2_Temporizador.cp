#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula041_Timer2_Temporizador.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula041_Timer2_Temporizador.c"
void interrupt();

void main() {

 TRISD = 0;
 PORTD = 0;






 T2CON = 0b01100110;
 PR2 = 240;

 INTCON = 0b11000000;

 PIE1 = 0b00000010;
 PIR1 = 0b00000000;


 while(1){

 }

}

void interrupt(){

 if(PIR1.TMR2IF){
 PIR1.TMR2IF = 0;
 RD7_bit = ~RD7_bit;
 }

}
