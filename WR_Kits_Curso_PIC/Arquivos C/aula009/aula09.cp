#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula09.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula09.c"
int numbers;

void main() {
 CMCON = 7;
 TRISA = 3;
 PORTA = 0;

 while(1){
 numbers = rand();
  RA3_bit  = numbers;
  RA2_bit  = ~ RA3_bit ;

 while( RA3_bit ){
 if( RA1_bit  == 0)  RA3_bit  = 0;
 delay_ms(70);
 }
 while( RA2_bit ){
 if( RA0_bit  == 0)  RA2_bit  = 0;
 delay_ms(70);
 }
 delay_ms(500);
 }

}
