// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jun 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:

  Aula054: CCS vs MikroC Pro for PIC

  Clock: 4MHz
  Ciclo de M�quina: 1us
  Sistema Embarcado PARADOXUS 9

*/

// --- observa��es e coment�rios gerais --- //
/*
  6 pressionamentos de S1 ligam/desligam o LED1
*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
// Lcd pinout settings

#define L1            RA3_bit
#define L2            RA2_bit
#define S1            RA1_bit
#define S2            RA0_bit

#define output        RB7_bit


// --- prot�tipo das fun��oes --- //
void interrupt();

// --- vari�veis globais --- //
unsigned int counter = 0;

// --- programa principal --- //
void main() {
  CMCON = 0x07;             // desabilita os comparadores internos
  OPTION_REG = 0b10000001;  // (81h) 
                            // resistores de pull-up desabilitados
                            // prescaler 1:4

  INTCON = 0b10100000;      // (A0h) 
                            // interrup��o global (GIE)
                            // interrup��o por TIMER 0 (T0IE)

  TMR0 = 6;               // incializa o TMR0

  TRISB = 0b01111111;       // apenas RB7 como sa�da
  PORTB = 0b01111111;       // PORT RB7 incia em n�vel baixo

  while(1)
  {
    // apenas aguarda a interrup��o
  }

}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){

  if(T0IF_bit){ // houve estouro do TIMER 0?
    // sim...
    T0IF_bit = 0;
    TMR0 = 6;
    counter++;
    if(counter == 500){ // 500 * 1ms = 500ms?
      // sim...
      counter = 0;
      output = ~output;
    }
  }

}