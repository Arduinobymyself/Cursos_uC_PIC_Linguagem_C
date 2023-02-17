#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/06_MICRO_I_LAB/codigo_1.c"




void main() {

 ADCON1 = 7;
 TRISD = 0;
 PORTD = 0;
 TRISB.RB0 = 1;
 PORTB.RB0 = 1;

 while(1){

 if(PORTB.RB0 == 0){
 PORTD.RD0 = 1;
 PORTD.RD0 = 0;
 delay_ms(10);
 }
 if(PORTB.RB1 == 0){
 PORTD.RD1 = 1;
 } else {
 PORTD.RD1 = 0;
 delay_ms(10);
 }

 }

}
