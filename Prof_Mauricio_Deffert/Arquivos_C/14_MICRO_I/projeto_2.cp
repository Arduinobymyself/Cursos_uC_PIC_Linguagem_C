#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/projeto_2.c"
#line 16 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/projeto_2.c"
bit flagB0, flagB1, flagB2;
unsigned int leitura = 0;

void main() {

 TRISA = 0xFF;
 TRISB = 0xFF;
 PORTB = 0xFF;
 TRISC = 0;
 PORTC = 0;

 ADC_Init();

 PWM1_Init(500);
 PWM1_Start();

 while(1){

 leitura = ADC_Read(0)/4;

 PWM1_Set_Duty(leitura);

 if(! RB0_bit  && !flagB0){
 flagB0 = 1;
 }
 if( RB0_bit  && flagB0){
 flagB0 = 0;
 RC3_bit = 1;
 RC4_bit = 0;
 }

 if(! RB1_bit  && !flagB1){
 flagB1 = 1;
 }
 if( RB1_bit  && flagB1){
 flagB1 = 0;
 RC3_bit = 0;
 RC4_bit = 1;
 }

 if(! RB2_bit  && !flagB2){
 flagB2 = 1;
 }
 if( RB2_bit  && flagB2){
 flagB2 = 0;
 RC3_bit = 0;
 RC4_bit = 0;
 }

 }

}
