#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula044.c"
#line 18 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula044.c"
unsigned char duty = 0;
int ADC = 0;

void interrupt();

void main() {

 CMCON = 7;
 OPTION_REG = 0x87;
 GIE_bit = 1;
 PEIE_bit = 1;
 TMR0IE_bit = 1;
 ADON_bit = 1;
 ADCON1 = 0x0E;
 TRISA = 0b00000001;
 TRISC = 0b00000000;
 PORTC = 0b00000000;

 duty = 16;
#line 54 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula044.c"
 while(1){

 ADC = (Adc_Read(0))/64;
#line 67 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula044.c"
 duty = ADC + 16;



 }

}


void interrupt(){

 if(TMR0IF_bit){
 TMR0IF_bit = 0;
 if( RC0_bit ){
 TMR0 = duty;
  RC0_bit  = 0;
 } else {
 TMR0 = 255 - duty;
  RC0_bit  = 1;
 }
 }




}
