#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I/Controle_Motor_Passo.c"
#line 33 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/10_MICRO_I/Controle_Motor_Passo.c"
unsigned char texto[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
unsigned int tempo = 100;
bit flagB0, flagB1, flagB2;
unsigned char flagCCW = 0, flagCW = 1;
unsigned char velocidade = 4;



void CW();
void CCW();
void speed();

void main() {

 ADCON1 = 7;
 CMCON = 7;
 TRISA = 0;
 PORTA = 0;
 TRISB = 7;
 TRISC = 0;
 PORTC = 0;
 TRISD = 0;
 PORTD = 0;

 PORTC.RC4 = 1;

 while(1){

 PORTD = texto[velocidade];

 speed();

 if( Button(&PORTB, 2, 100, 0)  && flagB2 == 0){
 flagB2 = 1;
 }
 if(! Button(&PORTB, 2, 100, 0)  && flagB2 == 1){
 flagB2 = 0;

 if(flagCW){
 flagCW = 0;
 flagCCW = 1;
 } else if(flagCCW){
 flagCCW = 0;
 flagCW = 1;
 }

 }

 CCW();
 CW();


 }


}

void speed(){

 if( Button(&PORTB, 0, 100, 0)  && flagB0 == 0){
 flagB0 = 1;
 }
 if(! Button(&PORTB, 0, 100, 0)  && flagB0 == 1){
 flagB0 = 0;
 tempo -= 100;
 velocidade++;
 if(tempo < 100 || velocidade > 4){
 tempo = 100;
 velocidade = 4;
 }
 }

 if( Button(&PORTB, 1, 100, 0)  && flagB1 == 0){
 flagB1 = 1;
 }
 if(! Button(&PORTB, 1, 100, 0)  && flagB1 == 1){
 flagB1 = 0;
 tempo += 100;
 velocidade--;
 if(tempo > 400 || velocidade < 1){
 tempo = 400;
 velocidade = 1;
 }
 }

}

void CCW(){


 if(flagCCW){
 PORTA.RA0 = 0;
 PORTA.RA1 = 1;

 PORTC = 0b00000001;
 Vdelay_ms(tempo);
 PORTC = 0b00000010;
 Vdelay_ms(tempo);
 PORTC = 0b00000100;
 Vdelay_ms(tempo);
 PORTC = 0b00001000;
 Vdelay_ms(tempo);
 }

}

void CW(){

 if(flagCW){

 PORTA.RA0 = 1;
 PORTA.RA1 = 0;

 PORTC = 0b00000001;
 Vdelay_ms(tempo);
 PORTC = 0b00001000;
 Vdelay_ms(tempo);
 PORTC = 0b00000100;
 Vdelay_ms(tempo);
 PORTC = 0b00000010;
 Vdelay_ms(tempo);
 }

}
