#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/12f675_teste_leitura analógica.c"







int leitura = 0;

void main() {
 ANSEL = 0b00000001;
 ADCON0 = 0b00000001;
 CMCON = 0b00000111;
 TRISIO = 0b00000001;
 GPIO = 0;

 while(1){

 leitura = adc_read(0);

 if(leitura > 256){
  GPIO.F1  = 1;
  GPIO.F2  = 0;
  GPIO.F4  = 0;
 }

 if(leitura > 512){
  GPIO.F1  = 0;
  GPIO.F2  = 1;
  GPIO.F4  = 0;
 }

 if(leitura > 768){
  GPIO.F1  = 0;
  GPIO.F2  = 0;
  GPIO.F4  = 1;
 }

 }

}
