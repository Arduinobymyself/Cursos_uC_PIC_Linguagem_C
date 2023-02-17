#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Conversor-AD_2/Conversor-AD_2.c"
#line 8 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/Conversor-AD_2/Conversor-AD_2.c"
unsigned char leituraAD;

void main() {
TRISD = 0b00000000;
PORTD = 0b00000000;
TRISA.RA0 = 1;

while(1){
 leituraAD = ADC_Read(0) / 4;



 PORTD = leituraAD;
 }
}
