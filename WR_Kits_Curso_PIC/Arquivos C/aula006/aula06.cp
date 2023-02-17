#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula06.c"






void main() {
 cmcon = 0b00000111;
 ansel = 0b00000000;

 trisio0_bit = 1;
 trisio1_bit = 1;

 trisio4_bit = 0;
 trisio5_bit = 0;

  gpio.f0  = 1;
  gpio.f1  = 1;
  gpio.f4  = 0;
  gpio.f5  = 0;

 while(1){
 if(! gpio.f0 ){
  gpio.f4  = ~ gpio.f4 ;
 delay_ms(300);
 }
 if(! gpio.f1 ){
  gpio.f5  = ~ gpio.f5 ;
 delay_ms(300);
 }
 }


}
