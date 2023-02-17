#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/16f84a_paradoxus.c"
#line 17 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/16f84a_paradoxus.c"
bit flagS1, flagS2;


void main() {

 TRISA = 0b00000011;
 PORTA = 0b00000011;

 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){

 if(! RA0_bit  && flagS1 == 0){
 flagS1 = 1;
 }
 if( RA0_bit  && flagS1 == 1){
 flagS1 = 0;
  RA2_bit  = ~ RA2_bit ;
 }

 if(! RA1_bit  && flagS2 == 0){
 flagS2 = 1;
 }
 if( RA1_bit  && flagS2 == 1){
 flagS2 = 0;
  RA3_bit  = ~ RA3_bit ;
 }

 }

}
