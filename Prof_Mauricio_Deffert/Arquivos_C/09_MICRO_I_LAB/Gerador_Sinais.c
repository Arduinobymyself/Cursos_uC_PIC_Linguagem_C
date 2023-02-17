/*
  Desenvolvimento de um Gerador de Sinais de ondas Quadrada e Triangular.
  Controle de frequência por meio da função Vdelay_ms()
  Pino RC0 do PIC16F877A fornecerá uma onda quadrada
  A onda Triangular será obtida chaveando a onda quadrada para um circuito
  integrador.
  Intervalo de frequências: 50Hz a 478Hz
  
  B0: diminui frequência
  B1: aumenta frequência
  B2: troca forma de onda
  
  RC3 controla relá para troca de fomra de onda
  
  Indicação de frequência:
  LEDs      L3 L2 L1 L0 FREQ(Hz) Vdelay_ms()
            0  0  0  1  478      1
            0  0  1  0  244      2
            0  0  1  1  164      3
            0  1  0  0  123      4
            0  1  0  1  99       5
            0  1  1  0  82       6
            0  1  1  1  71       7
            1  0  0  0  62       8
            1  0  0  1  55       9
            1  0  1  0  50       10
  
  
  
*/
#define B0 Button(&PORTB, 0, 100, 0)
#define B1 Button(&PORTB, 1, 100, 0)
#define B2 Button(&PORTB, 2, 100, 0)

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
  
    if(B2 && flagB2 == 0){
      flagB2 = 1;
    }
    if(!B2 && flagB2 == 1){
      flagB2 = 0;
      PORTC.RC5 = ~PORTC.RC5;
    }

    if(B0 && flagB0 == 0){
      flagB0 = 1;
    }
    if(!B0 && flagB0 == 1){
      flagB0 = 0;
      frequencia--;
      if(frequencia < 1) frequencia = 1;
    }
    
    if(B1 && flagB1 == 0){
      flagB1 = 1;
    }
    if(!B1 && flagB1 == 1){
      flagB1 = 0;
      frequencia++;
      if(frequencia > 10) frequencia = 10;
    }
    
    PORTD = frequencia;
    PORTC.RC0 = ~PORTC.RC0;
    Vdelay_ms(frequencia);
    
  }

}