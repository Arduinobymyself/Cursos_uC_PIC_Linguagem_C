#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_1_1.c"
#line 10 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_1_1.c"
void main() {
 ADCON1 = 7;
 TRISD = 0;
 PORTD = 0;
 TRISC = 0;
 PORTC = 0;

 while(1){
 PORTD = 79;
 PORTC.RC4 = 1;
 delay_ms(10);
 PORTC.RC4 = 0;

 PORTD = 109;
 PORTC.RC5 = 1;
 delay_ms(10);
 PORTC.RC5 = 0;
 }

}
