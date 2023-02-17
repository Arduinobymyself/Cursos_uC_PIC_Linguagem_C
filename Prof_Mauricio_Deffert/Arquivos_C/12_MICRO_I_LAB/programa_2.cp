#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I_LAB/programa_2.c"
#line 8 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I_LAB/programa_2.c"
unsigned char leituraAD;
int temp = 0;

void main() {
TRISD = 0b00000000;
PORTD = 0b00000000;
TRISA.RA1 = 1;

while(1){
 leituraAD = ADC_Read(1);
 leituraAD /= 4;



 temp = leituraAD*0.4887;

 PORTD = leituraAD;
 }
}
