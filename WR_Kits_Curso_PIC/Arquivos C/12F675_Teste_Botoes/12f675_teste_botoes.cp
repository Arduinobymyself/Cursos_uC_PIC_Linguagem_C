#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/12f675_teste_botoes.c"





bit flagB5, flagB4;


void main() {
 ANSEL = 0;
 CMCON = 7;


 TRISIO = 0b00110000;
 GPIO = 0b00110000;
 while(1){

 if(! Button(&GPIO, 5, 100, 0)  && flagB5 == 0){
 flagB5 = 1;
 }
 if( Button(&GPIO, 5, 100, 0)  && flagB5 == 1){
 flagB5 = 0;
  GPIO.F0  = ~ GPIO.F0 ;
 }

 if(! Button(&GPIO, 4, 100, 0)  && flagB4 == 0){
 flagB4 = 1;
 }
 if( Button(&GPIO, 4, 100, 0)  && flagB4 == 1){
 flagB4 = 0;
  GPIO.F1  = ~ GPIO.F1 ;
 }

 }


}
