#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_3.c"
#line 9 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/programa_3.c"
unsigned char num, cont, dezena, unidade;
unsigned char texto[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

void main() {
 ADCON1 = 7;
 TRISD = 0;
 PORTD = 0;
 TRISC = 0;
 PORTC = 0;

 while(1){


 for(cont = 0; cont < 100; cont++){
 dezena = num/10;
 PORTD = texto[dezena];
 PORTC.RC4 = 1;
 delay_ms(5);
 PORTC.RC4 = 0;
 PORTD = 0;

 unidade = num%10;
 PORTD = texto[unidade];
 PORTC.RC5 = 1;
 delay_ms(5);
 PORTC.RC5 = 0;
 PORTD = 0;

 }

 num++;

 }

}
