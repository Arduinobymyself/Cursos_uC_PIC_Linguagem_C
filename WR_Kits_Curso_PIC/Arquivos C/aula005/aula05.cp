#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula05.c"





void main() {
 ANSEL = 0;
 CMCON = 7;
 TRISIO0_bit = 0;
 TRISIO1_bit = 0;

 GPIO = 0;

 while(1){

 gpio.f0 = 1;
 delay_ms(10);
 gpio.f0 = 0;
 delay_ms(10);


 gpio.f1 = 1;
 delay_ms(1);
 gpio.f1 = 0;
 delay_ms(1);
 }

}
