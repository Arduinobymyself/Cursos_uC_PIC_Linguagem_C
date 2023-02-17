#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/aula011.c"
#line 37 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/aula011.c"
bit flagB0, flagB1;
signed char cont = 0;


void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0x03;


 while(1){

 if(! Button(&PORTB, 0, 50, 0)  && flagB0 == 0){
 flagB0 = 1;
 }
 if( Button(&PORTB, 0, 50, 0)  && flagB0 == 1){
 cont++;
 if(cont >= 8){
 cont = 8;
 }
 flagB0 = 0;
 }


 if(! Button(&PORTB, 1, 50, 0)  && flagB1 == 0){
 flagB1 = 1;
 }
 if( Button(&PORTB, 1, 50, 0)  && flagB1 == 1){
 cont--;
 if(cont <= 0){
 cont = 0;
 }
 flagB1 = 0;
 }

 switch(cont){
 case 0:  PORTD  = 0b00000000; break;
 case 1:  PORTD  = 0b00000001; break;
 case 2:  PORTD  = 0b00000010; break;
 case 3:  PORTD  = 0b00000100; break;
 case 4:  PORTD  = 0b00001000; break;
 case 5:  PORTD  = 0b00010000; break;
 case 6:  PORTD  = 0b00100000; break;
 case 7:  PORTD  = 0b01000000; break;
 case 8:  PORTD  = 0b10000000; break;

 }

 }
}
