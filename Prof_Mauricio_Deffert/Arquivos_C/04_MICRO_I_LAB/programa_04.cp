#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/04_MICRO_I_LAB/programa_04.c"






void main() {
ADCON1 = 0b00000111;
TRISD = 0b00000000;
PORTD = 0b00000000;

 while(1){
 PORTD++;
 delay_ms(300);
 }

}
