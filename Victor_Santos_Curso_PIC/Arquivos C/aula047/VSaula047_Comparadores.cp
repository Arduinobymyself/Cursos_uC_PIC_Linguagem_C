#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula047_Comparadores.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula047_Comparadores.c"
 void interrupt();


void main() {

 TRISD = 0;
 PORTD = 0;

 TRISA = 0b00001111;

 CMCON = 0b00000010;





 INTCON = 0b11000000;
 PIE2 = 0b01000000;
 PIR2 = 0b00000000;
#line 39 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula047_Comparadores.c"
 while(1){
#line 54 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula047_Comparadores.c"
 }

}


 void interrupt(){

 if(CMIF_bit){

 if(C1OUT_bit){
 RD0_bit = 1;
 } else {
 RD0_bit = 0;
 }

 if(C2OUT_bit){
 RD7_bit = 1;
 } else {
 RD7_bit = 0;
 }

 }
 CMIF_bit = 0;

 }
