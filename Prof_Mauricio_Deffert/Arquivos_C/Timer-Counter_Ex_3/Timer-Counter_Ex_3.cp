#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_Ex_3.c"
#line 33 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Timer-Counter_Ex_3.c"
unsigned int dezena, unidade, num;
char cont;
unsigned char pattern[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};


void interrupt();
void display_dezena();
void display_unidade();
void config_timer();
void config_ports();
void config_interrupt();


void main() {

 ADCON1 = 7;

 config_ports();
 config_interrupt();
 config_timer();

 num = 0;

 while(1){
 if(num == 100) num = 0;
 display_dezena();
 display_unidade();
 }

}


void interrupt(){
 if(INTCON.TMR0IF == 1){
 cont++;
 if(cont == 40){
 num++;
 cont = 0;
 }
 TMR0 = 61;
 INTCON.TMR0IF = 0;
 }
}

void display_dezena(){
 PORTC.RC4 = 1;
 dezena = num/10;
 PORTD = pattern[dezena];
 delay_ms(5);
 PORTC.RC4 = 0;
 PORTD = 0;
}

void display_unidade(){
 PORTC.RC5 = 1;
 unidade = num%10;
 PORTD = pattern[unidade];
 delay_ms(5);
 PORTC.RC5 = 0;
 PORTD = 0;
}

void config_timer(){
 OPTION_REG = 0b10000111;
 TMR0 = 61;
 INTCON.TMR0IF = 0;
}

void config_ports(){
 TRISD = 0b00000000;
 PORTD = 0b00000000;
 TRISC = 0b00000000;
 PORTC = 0b00000000;
}

void config_interrupt(){
 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;
}
