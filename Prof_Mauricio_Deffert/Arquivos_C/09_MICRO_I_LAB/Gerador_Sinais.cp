#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/Gerador_Sinais.c"
#line 35 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/09_MICRO_I_LAB/Gerador_Sinais.c"
unsigned int tempo = 0;
unsigned int frequencia = 1;
bit flagB0, flagB1, flagB2;

void main() {

 ADCON1 = 7;
 TRISB = 0xFF;
 TRISC = 0x00;
 PORTC = 0x00;
 TRISD = 0x00;
 PORTD = 0x00;

 while(1){

 if( Button(&PORTB, 2, 100, 0)  && flagB2 == 0){
 flagB2 = 1;
 }
 if(! Button(&PORTB, 2, 100, 0)  && flagB2 == 1){
 flagB2 = 0;
 PORTC.RC5 = ~PORTC.RC5;
 }

 if( Button(&PORTB, 0, 100, 0)  && flagB0 == 0){
 flagB0 = 1;
 }
 if(! Button(&PORTB, 0, 100, 0)  && flagB0 == 1){
 flagB0 = 0;
 frequencia--;
 if(frequencia < 1) frequencia = 1;
 }

 if( Button(&PORTB, 1, 100, 0)  && flagB1 == 0){
 flagB1 = 1;
 }
 if(! Button(&PORTB, 1, 100, 0)  && flagB1 == 1){
 flagB1 = 0;
 frequencia++;
 if(frequencia > 10) frequencia = 10;
 }

 PORTD = frequencia;
 PORTC.RC0 = ~PORTC.RC0;
 Vdelay_ms(frequencia);

 }

}
