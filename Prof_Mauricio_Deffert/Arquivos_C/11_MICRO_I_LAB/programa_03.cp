#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/11_MICRO_I_LAB/programa_03.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/11_MICRO_I_LAB/programa_03.c"
void interrupt();
void config_mcu();
void config_interrupt();
void config_timer();
void display_unidade();
void display_dezena();



char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
unsigned int unidade, dezena, num = 0;
unsigned char contador;


void main() {

 config_mcu();
 config_interrupt();
 config_timer();

 while(1){

 if(num == 100) num = 0;
 display_unidade();
 display_dezena();

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
 num++;
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
