#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/03_micro_I_LAB/programa_01.c"









void main() {

 ADCON1 = 7;

 TRISD = 0;
 PORTD = 0;

 while(1){
 PORTD.RD1 = 1;
 delay_ms(1000);
 PORTD.RD1 = 0;
 delay_ms(1000);
 }

}
