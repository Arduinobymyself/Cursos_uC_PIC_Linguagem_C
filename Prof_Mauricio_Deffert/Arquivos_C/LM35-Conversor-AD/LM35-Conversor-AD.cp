#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/LM35-Conversor-AD.c"
#line 8 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/LM35-Conversor-AD.c"
unsigned int leituraAD;

void main() {

 TRISD = 0b00000000;
 PORTD = 0B00000000;
 TRISA.RA1 = 1;



 while(1){
 leituraAD = adc_read(1);
 leituraAD = (leituraAD / 4);


 PORTD = leituraAD;
 }
}
