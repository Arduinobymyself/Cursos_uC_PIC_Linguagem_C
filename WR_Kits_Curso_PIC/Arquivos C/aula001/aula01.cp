#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula01.c"






void main() {
 CMCON = 0X07;
 TRISB = 0b00000000;
 PORTB = 0b00000000;

 while(1){
 RB1_bit = 0;
 delay_ms(500);
 RB1_bit = 1;
 delay_ms(500);

 }


}
