#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/07_MICRO_I_LAB/programa_1.c"



unsigned char statusB0 = 0;

void main() {
 ADCON1 = 0X07;
 TRISB = 0b00000001;
 TRISD = 0X00;
 PORTD = 0X00;

 while( 1 ){
 if( PORTB.RB0  && statusB0 == 0){
 delay_ms(40);
 statusB0 = 1;
 PORTD = ~PORTD;
 }
 if(! PORTB.RB0  && statusB0 == 1){
 delay_ms(40);
 statusB0 = 0;
 }
 }

}
