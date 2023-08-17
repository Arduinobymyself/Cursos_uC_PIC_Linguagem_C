// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jun 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

  Aula054: CCS vs MikroC Pro for PIC

  Clock: 4MHz
  Ciclo de Máquina: 1us
  Sistema Embarcado PARADOXUS 9

*/

// --- observações e comentários gerais --- //
/*
  6 pressionamentos de S1 ligam/desligam o LED1
*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// Lcd pinout settings

#define L1            RA3_bit
#define L2            RA2_bit
#define S1            RA1_bit
#define S2            RA0_bit

#define output        RB7_bit


// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //
unsigned int counter = 0;

// --- programa principal --- //
void main() {
  CMCON = 0x07;             // desabilita os comparadores internos
  OPTION_REG = 0b10000001;  // (81h) 
                            // resistores de pull-up desabilitados
                            // prescaler 1:4

  INTCON = 0b10100000;      // (A0h) 
                            // interrupção global (GIE)
                            // interrupção por TIMER 0 (T0IE)

  TMR0 = 6;               // incializa o TMR0

  TRISB = 0b01111111;       // apenas RB7 como saída
  PORTB = 0b01111111;       // PORT RB7 incia em nível baixo

  while(1)
  {
    // apenas aguarda a interrupção
  }

}

// --- definição das funções auxiliares --- //
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