#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula12.c"
#line 36 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula12.c"
int leitura = 0;


void main() {
ansel = 0x01;
adcon0 = 0x01;
cmcon = 0x07;

trisio = 0x01;
gpio = 0x00;

 while(1){

 leitura = adc_read(0);

 if(leitura > 0){
  gpio.f1  = 0;
  gpio.f2  = 0;
  gpio.f4  = 0;
  gpio.f5  = 0;
 }
 if(leitura > 256){
  gpio.f1  = 1;
  gpio.f2  = 0;
  gpio.f4  = 0;
  gpio.f5  = 0;
 }
 if(leitura > 512){
  gpio.f1  = 1;
  gpio.f2  = 1;
  gpio.f4  = 0;
  gpio.f5  = 0;
 }
 if(leitura > 768){
  gpio.f1  = 1;
  gpio.f2  = 1;
  gpio.f4  = 1;
  gpio.f5  = 0;
 }
 if(leitura > 816){
  gpio.f1  = 1;
  gpio.f2  = 1;
  gpio.f4  = 1;
  gpio.f5  = 1;
 }
 delay_ms(100);
 }
}
