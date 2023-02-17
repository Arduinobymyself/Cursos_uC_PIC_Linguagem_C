#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula008.c"
#line 38 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula008.c"
bit flagS0, flagS1;


void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0x03;


 while(1){
#line 130 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula008.c"
 if ( Button(&PORTB, 0, 50, 1)  && flagS0 == 0){
 flagS0 = 1;
 }
 if ( Button(&PORTB, 1, 50, 0)  && flagS1 == 0){
 flagS1 = 1;
 }
 if (! Button(&PORTB, 0, 50, 1)  && flagS0 == 1){
  rd6_bit  = ~ rd6_bit ;
 flagS0 = 0;
 }
 if (! Button(&PORTB, 1, 50, 0)  && flagS1 == 1){
  rd7_bit  = ~ rd7_bit ;
 flagS1 = 0;
 }







 }
}
