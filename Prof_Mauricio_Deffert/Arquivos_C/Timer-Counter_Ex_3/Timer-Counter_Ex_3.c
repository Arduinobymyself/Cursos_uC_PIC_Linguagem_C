/*************************************************************
********************** CONTADOR 0 � 99 ***********************
Autor: Marcelo Moraes
Descri��o: ao ligar o uC, dois displays de 7 segmentos iniciar�o
uma contagem de 00 at� 99, com intervalos de 1 segundo, utilizando
como base de tempo o TIMER 0, reiniciando a sua contagem ap�s 99.
MCU: PIC16F877A
Oscilador: 8 MHz
Compilador: MikroC PRO for PIC v.4.15
Notas:
Displays catodo comum ligado ao barramento do port D e C
RD0 -> a
RD1 -> b
RD2 -> c
RD3 -> d
RD4 -> e
RD5 -> f
RD6 -> g
RD7 -> dp
RC4 -> DSP1
RC5 -> DSP2
Bot�es B0 -> RB0 reset  e RA4 contagem

TIMER 0
Tempo m�ximo = 32,768ms
Calculo da temporiza��o do timer 0 para 25ms -> Fosc=8MHz
para 1 seg -> 25ms*40=1s   portanto 40 estouros de 25ms
25ms = 0,5us*256*(256-CI)
CI = 61
*************************************************************/

// --- declara��o de vari�veis --- //
unsigned int dezena, unidade, num;
char cont;
unsigned char pattern[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

// --- prot�tipo das fun��es --- //
void interrupt();            // executa as interrup��oes
void display_dezena();      // display das dezenas
void display_unidade();     // display das unidades
void config_timer();         // configura o TIMER 0
void config_ports();         // configura os ports C e D
void config_interrupt();     // configura as interrup��es


void main() {

  ADCON1 = 7; // configura A/D para todo digital
  
  config_ports();          // chama fun��o de configura��o de ports
  config_interrupt();      // chama fun��o de configura��o de interrup��es
  config_timer();          // chama fun��o de configura��o de timers

  num = 0;

  while(1){
    if(num == 100) num = 0;
    display_dezena();
    display_unidade();
  }

}

// --- desenvolvimento das fun��es auxiliares --- //
void interrupt(){
  if(INTCON.TMR0IF == 1){
    cont++;
    if(cont == 40){ // 40*25ms = 1s
      num++;
      cont = 0;
    }
    TMR0 = 61;          // recarregamento do registrador TIMER 0
    INTCON.TMR0IF = 0;  // reincia a flag de estouro do TIMER 0
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
  OPTION_REG = 0b10000111;   // liga TIMER 0 - prescaler 1:256
  TMR0 = 61;                 // carregamento incial do registrador TMR0
  INTCON.TMR0IF = 0;         // reincia a flag de estouro do TIMER 0
}

void config_ports(){
  TRISD = 0b00000000;
  PORTD = 0b00000000;
  TRISC = 0b00000000;
  PORTC = 0b00000000;
}

void config_interrupt(){
  INTCON.GIE = 1;       // habilita interup��o global
  INTCON.PEIE = 0;      // desabilita interrup��o por perif�ricos
  INTCON.TMR0IE = 1;    // habilita interrup��o por estouro do TIMER 0
}