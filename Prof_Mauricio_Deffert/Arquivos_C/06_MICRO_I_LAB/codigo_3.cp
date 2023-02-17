#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/06_MICRO_I_LAB/codigo_3.c"
#line 14 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/06_MICRO_I_LAB/codigo_3.c"
void main() {

 ADCON1 = 7;
 TRISD = 0;
 PORTD = 0;
 TRISB.RB0 = 1;
 PORTB.RB0 = 1;

 while( 1 ){

 if(PORTB.RB0 == 0){
 PORTD++;
 delay_ms(10);
 }

 }

}
