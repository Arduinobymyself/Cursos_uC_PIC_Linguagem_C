#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Conversor-AD_3/Conversor-AD_3.c"
#line 8 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Conversor-AD_3/Conversor-AD_3.c"
unsigned int leituraAD1, leituraAD2;

void main() {

 TRISB = 0b00000000;
 PORTB = 0b00000000;
 TRISC = 0b00000000;
 PORTC = 0b00000000;
 TRISD = 0b00000000;
 PORTD = 0b00000000;

 TRISA.RA0 = 1;

 while(1){
 leituraAD1 = ADC_Read(0) / 4;

 PORTD = leituraAD1;
 leituraAD2 = ADC_Read(0);
 PORTB = leituraAD2;
 PORTC = leituraAD2 >> 8;
 }

}
