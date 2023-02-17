#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/08_MICRO_I_LAB/Relogio_Binario.c"
#line 29 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/08_MICRO_I_LAB/Relogio_Binario.c"
char horas, minutos, segundos;
char ajuste = 3;

void config_mcu();
void atualiza();



void main() {

 config_mcu();

 horas = 12;
 minutos = 59;
 segundos = 50;
 ajuste = 3;

 PORTD = segundos;
 PORTC = minutos;
 PORTA = horas;

 PORTE.RE2 = 0;
 PORTE.RE1 = 1;

 while( 1 ){

 segundos++;

 if(segundos > 59){
 segundos = 0;
 minutos++;
 }
 if(minutos > 59){
 segundos = 0;
 minutos = 0;
 horas++;
 }
 if(horas > 12){
 PORTE.RE2 = ~PORTE.RE2;
 PORTE.RE1 = ~PORTE.RE1;
 segundos = 0;
 minutos = 0;
 horas = 1;
 }

 atualiza();

 if( Button(&PORTB, 0, 50, 0) ){
 ajuste = 0;
 PORTD.RD6 = 1;
 }
 if( Button(&PORTB, 1, 50, 0) ){
 ajuste = 1;
 PORTD.RD6 = 1;
 }
 if( Button(&PORTB, 2, 50, 0) ){
 ajuste = 2;
 PORTD.RD6 = 1;
 }
 if( Button(&PORTB, 3, 50, 0) ){
 ajuste = 3;
 PORTD.RD6 = 0;
 }

 while(ajuste == 0){
 PORTD.RD6 = 1;
 if( Button(&PORTB, 2, 50, 0) ){
 delay_ms(200);
 minutos++;
 if(minutos > 59){
 minutos = 0;
 horas++;
 if(horas > 12){
 PORTE.RE2 = ~PORTE.RE2;
 PORTE.RE1 = ~PORTE.RE1;
 horas = 1;
 atualiza();
 }
 atualiza();
 }
 atualiza();
 }
 if( Button(&PORTB, 3, 50, 0) ) ajuste = 3;
 }
 while(ajuste == 1){
 PORTD.RD6 = 1;
 if( Button(&PORTB, 2, 50, 0) ){
 delay_ms(200);
 horas++;
 if(horas > 12){
 PORTE.RE2 = ~PORTE.RE2;
 PORTE.RE1 = ~PORTE.RE1;
 horas = 1;
 atualiza();
 }
 atualiza();
 }
 if( Button(&PORTB, 3, 50, 0) ){
 ajuste = 3;
 PORTD.RD6 = 0;
 }
 }

 PORTE.RE0 = 1;
 delay_ms(500);
 PORTE.RE0 = 0;
 delay_ms(500);

 }

}

void atualiza(){
 PORTA = horas;
 PORTC = minutos;
 PORTD = segundos;
}

void config_mcu(){
 ADCON1 = 7;
 TRISA = 0;
 PORTA = 0;
 TRISB = 255;

 TRISC = 0;
 PORTC = 0;
 TRISD = 0;
 PORTD = 0;
 TRISE = 0;
 PORTE = 0;
}
