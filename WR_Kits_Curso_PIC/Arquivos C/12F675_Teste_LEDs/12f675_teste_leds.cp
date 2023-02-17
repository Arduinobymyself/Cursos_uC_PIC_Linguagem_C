#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/12f675_teste_leds.c"



void main() {
 ANSEL =0;
 CMCON = 7;


 TRISIO = 0b00000000;
 GPIO = 0;
 while(1){
 GPIO.F0 = 1;
 delay_ms(300);
 GPIO.F0 = 0;
 GPIO.F1 = 1;
 delay_ms(300);
 GPIO.F1 = 0;
 GPIO.F2 = 1;
 delay_ms(300);
 GPIO.F2 = 0;
 GPIO.F4 = 1;
 delay_ms(300);
 GPIO.F4 = 0;

 }

}
