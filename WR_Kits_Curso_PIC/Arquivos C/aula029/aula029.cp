#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula029.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula029.c"
void interrupt();




void main() {

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 PIE1.TMR2IE = 1;
 T2CON = 0b00011101;
 PR2 = 100;
 TRISB = 0;
 PORTB = 0;









 while(1){

 }

}


void interrupt(){

 if(PIR1.TMR2IF){
 PORTB = ~PORTB;
 PIR1.TMR2IF = 0;
 }

}
