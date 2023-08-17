// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jun 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

  Aula053: Incremento do TIMER 0 através de Evento Externo

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
#define backlight     RB2_bit


// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0x07;             // desabilita os comparadores internos
  OPTION_REG = 0b10111000;  // resistores de pull-up desabilitados
                            // incremento do TIMER 0 por evento de transição em RA4
                            // transição righ-to-low
                            // prescaler para WDT 1:1

  INTCON = 0b10100000;      // interrupção global (GIE)
                            // interrupção por TIMER 0 (T0IE)

  TMR0 = 250;               // incializa o TMR0
  
  TRISA = 0b11110111;       // apenas RA3 como saída
  L1 = 0;                   // LED1 inicia apagado

  while(1)
  {

  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(T0IF_bit){ // houve estouro do TIMER 0?
    // sim...
    T0IF_bit = 0;
    TMR0 = 250;
    L1 = ~L1;
  }

}
