#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_2.c"
#line 9 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_2.c"
unsigned char indice = 0;
unsigned char texto[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

void main() {
 ADCON1 = 7;
 TRISD = 0;
 PORTD = 0;
 TRISC.RC4 = 0;
 PORTC.RC4 = 1;

 while(1){
 if(indice == 10) indice = 0;
 PORTD = texto[indice];
 delay_ms(1000);
 indice++;
 }

}
