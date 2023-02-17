#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I_LAB/Termometro_Digital_LM35_Display7Seg.c"
#line 32 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/12_MICRO_I_LAB/Termometro_Digital_LM35_Display7Seg.c"
void display(unsigned char temp);


unsigned int leituraAD;
unsigned char minima, maxima;
unsigned char temperatura = 0;
unsigned char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
bit flagB0, flagB1;



void main() {

 TRISD = 0b00000000;
 PORTD = 0b00000000;
 TRISB = 0b00000011;
 PORTB = 0b00000011;
 TRISC = 0b00000000;
 PORTC = 0b00000000;

 TRISA1_bit = 1;
 ADC_Init();

 minima = 99;
 maxima = 0;

 while(1){

 leituraAD = ADC_Read(1);


 temperatura = leituraAD*0.4887;


 if(temperatura > 99) temperatura = 99;
 if(temperatura < 0) temperatura = 0;


 if(temperatura > maxima) maxima = temperatura;
 if(minima > temperatura) minima = temperatura;

 display(temperatura);


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



void display(unsigned char temp){

 char dezena, unidade;

 dezena = temp/10;
 RC4_bit = 1;
 PORTD = digitos[dezena];
 delay_ms(2);
 RC4_bit = 0;
 PORTD = 0;

 unidade = temp%10;
 RC5_bit = 1;
 PORTD = digitos[unidade];
 delay_ms(2);
 RC5_bit = 0;
 PORTD = 0;

}
