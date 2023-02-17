// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F877A (8MHz)
  Descri��o do Projeto:
            Ao ligar o uC, dois displays de 7-Seg iniciar�o uma contagem
            de 00 � 99, com intervalo de 1s, utilizando como base de tempo
            o Timer 0, reinciando sua contagem ap�s 99.
            PORT D -> Display 7-Seg (dados) RC0 ~ RC7 (a ~ dp)
            PORT C -> Display (controle) RC4(disp1) RC5(disp2)
            PORT B -> Bot�es B0 ~ B7
            p/ TE = 25ms -> CI = 61


*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//

// --- prot�tipo das fun��oes --- //
void interrupt();
void config_mcu();
void config_interrupt();
void config_timer();
void display_unidade();
void display_dezena();


// --- vari�veis globais --- //
char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
unsigned int unidade, dezena, num = 0;
unsigned char contador;

// --- programa principal --- //
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

// --- desenvolvimento das fun��es auxiliares --- //

void config_mcu(){

  ADCON1 = 7; // entradas nanal�gicas desabilitadas
  CMCON = 7;  // comparadores desabilitados

  TRISD = 0;  // PORT D como sa�da digital
  PORTD = 0;  // PORT D iniciaem n�vel baixo
  TRISC = 0;  // PORT C como sa�da digital
  PORTC = 0;  // PORT C iniciaem n�vel baixo

}

void config_interrupt(){

  INTCON.GIE = 1;    // habilita chave geral de interrup��es
  INTCON.PEIE = 0;   // n�o necess�rio
  INTCON.TMR0IE = 1; // habilita interrup��o por Timer 0
  
}

void config_timer(){

  OPTION_REG = 0b10000111;    // modo temporizador, prescaler 1:256
  TMR0 = 61;                  // carregamento do valor inicial do registrador
  INTCON.TMR0IF = 0;          // incializa o flag de estouro
  
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