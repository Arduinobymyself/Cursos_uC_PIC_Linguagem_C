#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/11_MICRO_I_LAB/programa_04_ContagemRegressiva.c"
#line 36 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/11_MICRO_I_LAB/programa_04_ContagemRegressiva.c"
void interrupt();
void config_mcu();
void config_interrupt();
void config_timer();
void display_unidade();
void display_dezena();
void start();
void pause();
void clear();
void blink();



char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
unsigned char unidade, dezena, num, lastNum;
unsigned char contador;

bit pauseFlag, startFlag, clearFlag, blinkFlag;
bit flagB0, flagB1, flagB2;


void main() {

 config_mcu();
 config_interrupt();
 config_timer();


 clearFlag = 1;
 INTCON.TMR0IE = 0;
 num = 10;

 while(1){

 clear();
 start();
 pause();

 if( Button(&PORTB, 0, 100, 0)  && flagB0 == 0){
 flagB0 = 1;
 }
 if(! Button(&PORTB, 0, 100, 0)  && flagB0 == 1){
 flagB0 = 0;
 if(pauseFlag) num++;
 if(num == 99) num = 0;
 }

 if( Button(&PORTB, 1, 100, 0)  && flagB1 == 0){
 flagB1 = 1;
 }
 if(! Button(&PORTB, 1, 100, 0)  && flagB1 == 1){
 flagB1 = 0;
 startFlag = 1;
 pauseFlag = 0;
 INTCON.TMR0IE = 1;
 }

 if( Button(&PORTB, 2, 100, 0)  && flagB2 == 0){
 flagB2 = 1;
 }
 if(! Button(&PORTB, 2, 100, 0)  && flagB2 == 1){
 flagB2 = 0;
 startFlag = !startFlag;
 pauseFlag = !pauseFlag;
 INTCON.TMR0IE = !INTCON.TMR0IE;
 }

 }

}



void start(){

 lastNum = num;

 if(startFlag && !pauseFlag){
 if(num == 0) num = 0;
 display_unidade();
 display_dezena();
 }

}

void pause(){

 if(pauseFlag && !startFlag){
 num = lastNum;
 display_unidade();
 display_dezena();
 }

}

void clear(){

 if(clearFlag){
 display_unidade();
 display_dezena();
 }

}

void blink(){

 while(blinkFlag){
 display_unidade();
 display_dezena();
 delay_ms(500);
 }

}

void config_mcu(){

 ADCON1 = 7;
 CMCON = 7;

 TRISD = 0;
 PORTD = 0;
 TRISC = 0;
 PORTC = 0;


}

void config_interrupt(){

 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;

}

void config_timer(){

 OPTION_REG = 0b10000111;
 TMR0 = 61;
 INTCON.TMR0IF = 0;

}

void interrupt(){

 if(INTCON.TMR0IF){
 contador++;
 if(contador == 40){
 num--;
 if(num == 0){
 num = 0;
 blinkFlag = 1;
 INTCON.TMR0IE = 0;
 blink();
 }
 contador = 0;
 }
 TMR0 = 61;
 INTCON.TMR0IF = 0;
 }

}

void display_dezena(){

 PORTC.RC4 = 1;
 dezena = num/10;
 PORTD = digitos[dezena];
 delay_ms(5);
 PORTC.RC4 = 0;
 PORTD = 0;

}
void display_unidade(){

 PORTC.RC5 = 1;
 unidade = num%10;
 PORTD = digitos[unidade];
 delay_ms(5);
 PORTC.RC5 = 0;
 PORTD = 0;

}
