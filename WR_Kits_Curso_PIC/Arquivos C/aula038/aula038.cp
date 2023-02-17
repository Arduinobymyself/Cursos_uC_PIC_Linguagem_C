#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula038.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula038.c"
void interrupt();




void main() {
 CMCON = 0b00000010;


 GIE_bit = 1;
 PEIE_bit = 1;
 CMIE_bit = 1;

 TRISA = 0b00001111;
 TRISB = 0;
 PORTB = 0;






}


void interrupt(){
 if(CMIF_bit){
 CMIF_bit = 0;
 if(C1OUT_bit){
 RB3_bit = 1;
 } else {
 RB3_bit = 0;
 }
 }
}
