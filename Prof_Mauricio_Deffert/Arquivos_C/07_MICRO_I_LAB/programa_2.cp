#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/07_MICRO_I_LAB/programa_2.c"










void main() {
 ADCON1 = 7;
 TRISB = 0XFF;
 PORTB = 0XFF;
 TRISC = 0;
 PORTC = 0;
 TRISD = 0;
 PORTD = 0;

 while(1){
 if( PORTB.RB0  == 0){
 delay_ms(40);
  PORTC.RC6 = 1, PORTC.RC7 = 0 ;
 }

 if( PORTB.RB2  == 0){
 delay_ms(50);
  PORTC.RC6 = 0, PORTC.RC7 = 0 ;
 while(PORTD < 16){
 PORTD++;
 delay_ms(1000);
 }
 PORTD = 0;
  PORTC.RC6 = 0, PORTC.RC7 = 1 ;
 }

 if( PORTB.RB1  == 0){
 delay_ms(50);
  PORTC.RC6 = 0, PORTC.RC7 = 0 ;
 while(PORTD < 16){
 PORTD++;
 delay_ms(1000);
 }
 PORTD = 0;
  PORTC.RC6 = 1, PORTC.RC7 = 0 ;
 }

 if( PORTB.RB3  == 0){
 delay_ms(50);
  PORTC.RC6 = 0, PORTC.RC7 = 0 ;
 }





 }


}
