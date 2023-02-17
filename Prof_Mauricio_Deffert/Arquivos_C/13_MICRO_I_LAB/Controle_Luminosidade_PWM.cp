#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/13_MICRO_I_LAB/Controle_Luminosidade_PWM.c"
#line 32 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/13_MICRO_I_LAB/Controle_Luminosidade_PWM.c"
void display(unsigned char lux);


unsigned int leituraAD;
unsigned char minima, maxima;
unsigned char luminosidade = 0;
unsigned char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
bit flagB0, flagB1;



void main() {

 TRISD = 0b00000000;
 PORTD = 0b00000000;
 TRISB = 0b00000011;
 PORTB = 0b00000011;
 TRISC = 0b00000000;
 PORTC = 0b00000000;

 TRISA0_bit = 1;
 ADC_Init();
 PWM1_Init(500);
 PWM1_Start();


 minima = 99;
 maxima = 0;

 while(1){

 leituraAD = ADC_Read(0);


 luminosidade = leituraAD*0.0978;
 PWM1_Set_Duty(leituraAD/4);



 if(luminosidade > 99) luminosidade = 99;
 if(luminosidade < 0) luminosidade = 0;


 if(luminosidade > maxima) maxima = luminosidade;
 if(luminosidade < minima) minima = luminosidade;

 display(luminosidade);


 if(Button(&PORTB, 0, 10, 0)){
 flagB0 = 1;
 }
 if(Button(&PORTB, 0, 10, 1) && flagB0){
 flagB0 = 0;
 while(1){
 display(maxima);
 if(Button(&PORTB, 0, 10, 0)){
 flagB0 = 1;
 }
 if(Button(&PORTB, 0, 10, 1) && flagB0){
 flagB0 = 0;
 break;
 }

 }
 }


 if(Button(&PORTB, 1, 10, 0)){
 flagB1 = 1;
 }
 if(Button(&PORTB, 1, 10, 1) && flagB1){
 flagB1 = 0;
 while(1){
 display(minima);
 if(Button(&PORTB, 1, 10, 0)){
 flagB1 = 1;
 }
 if(Button(&PORTB, 1, 10, 1) && flagB1){
 flagB1 = 0;
 break;
 }

 }
 }

 }

}



void display(unsigned char lux){

 char dezena, unidade;

 dezena = lux/10;
 RC6_bit = 1;
 PORTD = digitos[dezena];
 delay_ms(2);
 RC6_bit = 0;
 PORTD = 0;

 unidade = lux%10;
 RC7_bit = 1;
 PORTD = digitos[unidade];
 delay_ms(2);
 RC7_bit = 0;
 PORTD = 0;

}
