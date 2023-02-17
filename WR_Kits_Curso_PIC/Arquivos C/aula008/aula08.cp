#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula08.c"







void main() {

 CMCON = 0x07;
 TRISA = 0x03;
 PORTA = 0x00;

 while(1){
 if( RA1_bit  == 0){
 while(1){
  RA3_bit  = 1;
  RA2_bit  = 0;
 delay_ms(500);
  RA3_bit  = 0;
  RA2_bit  = 1;
 delay_ms(500);
 }
 }
 if( RA0_bit  == 0){
 while(1){
  RA3_bit  = 1;
  RA2_bit  = 1;
 delay_ms(500);
  RA3_bit  = 0;
  RA2_bit  = 0;
 delay_ms(500);
 }
 }
 }


}
