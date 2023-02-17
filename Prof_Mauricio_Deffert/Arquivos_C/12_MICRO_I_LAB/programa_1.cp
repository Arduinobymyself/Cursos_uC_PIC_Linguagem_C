#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I_LAB/programa_1.c"
#line 8 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I_LAB/programa_1.c"
void main() {
 TRISD = 0b00000000;
 PORTD = 0b00000000;
 TRISA.RA0 = 1;

 ADCON0 = 0b01000101;

 ADCON1 = 0b00001110;



 while(1){
 ADCON0.GO = 1;
 while(ADCON0.GO);
 PORTD = ADRESH;
 delay_ms(20);
 }
}
