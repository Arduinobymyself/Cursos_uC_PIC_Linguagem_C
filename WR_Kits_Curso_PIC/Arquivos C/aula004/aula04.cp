#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula04.c"



void main() {
 ANSEL =0;
 CMCON = 7;


 TRISIO = 0b00010000;
 GPIO = 0;
 while(1){
 if(GPIO.F5 == 1){
 GPIO.F0 = 1;
 delay_ms(2000);
 } else {
 GPIO.F0 = 0;
 }
 }

}
