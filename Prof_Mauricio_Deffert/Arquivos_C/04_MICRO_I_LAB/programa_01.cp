#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/04_MICRO_I_LAB/programa_01.c"







void main() {
ADCON1 = 0b00000111;
TRISB = 0b11111111;
TRISD = 0b00000000;
PORTB = 0b11111111;
PORTD = 0b00000000;

while(1){

 if(PORTB.RB0 == 0){
 PORTD.RD0 = 1;
 } else {
 PORTD.RD0 = 0;
 }
 if(PORTB.RB1 == 0){
 PORTD.RD1 = 1;
 } else {
 PORTD.RD1 = 0;
 }
 if(PORTB.RB2 == 0){
 PORTD.RD2 = 1;
 } else {
 PORTD.RD2 = 0;
 }
 if(PORTB.RB3 == 0){
 PORTD.RD3 = 1;
 } else {
 PORTD.RD3 = 0;
 }
 if(PORTB.RB4 == 0){
 PORTD.RD4 = 1;
 } else {
 PORTD.RD4 = 0;
 }
 if(PORTB.RB5 == 0){
 PORTD.RD5 = 1;
 } else {
 PORTD.RD5 = 0;
 }
 if(PORTB.RB6 == 0){
 PORTD.RD6 = 1;
 } else {
 PORTD.RD6 = 0;
 }
 if(PORTB.RB7 == 0){
 PORTD.RD7 = 1;
 } else {
 PORTD.RD7 = 0;
 }

 delay_ms(50);

}

}
