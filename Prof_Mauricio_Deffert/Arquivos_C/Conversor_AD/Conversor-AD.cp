#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Conversor_AD/Conversor-AD.c"
#line 9 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Conversor_AD/Conversor-AD.c"
void main() {
 TRISD = 0b00000000;
 PORTD = 0B00000000;
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
