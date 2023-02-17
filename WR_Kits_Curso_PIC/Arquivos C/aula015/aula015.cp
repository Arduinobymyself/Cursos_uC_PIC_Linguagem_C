#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula015.c"
#line 34 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula015.c"
void main() {
 CMCON = 0X07;
 TRISA = 0X03;
 PORTA = 0X03;

 while(1){
  RA3_bit  = 1;
  RA2_bit  = 0;
 delay_ms(10);
  RA3_bit  = 0;
  RA2_bit  = 1;
 delay_ms(10);
 }

}
