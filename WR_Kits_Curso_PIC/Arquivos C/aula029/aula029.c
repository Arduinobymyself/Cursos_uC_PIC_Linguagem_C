// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                     Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            Aula029 - TIMER 2

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L1 RA3_bit
#define L2 RA2_bit
#define S1 RA1_bit
#define S2 RA0_bit

// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //

// --- programa principal --- //
void main() {

  INTCON.GIE = 1; // habilita a interrupção global
  INTCON.PEIE = 1; // habilita a interrupção por periféricos
  PIE1.TMR2IE = 1; // habilita interrupção do Timer 2 por comparação TMR2 com PR2
  T2CON = 0b00011101; // (0), (0011) postscaler 1:4, (1) Timer 2 habilitado, (01) prescaler 1:4
  PR2 = 100; //
  TRISB = 0; // todo port B como saída
  PORTB = 0; // port B inciando em nível baixo

  // CM - Ciclo de Máquina
  // CM = Fosc/4
  // PS - PreScaler
  // PSTS - PoSTScaler
  // TE - Tempo de Estouro
  // PR2 - registrador de conparação do Timer 2
  // TE = CM*PR2*PS*PSTS = 1us*100*4*4 = 1,6ms

  while(1){

  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(PIR1.TMR2IF){ // se houve estouro do Timer 2
    PORTB = ~PORTB; // inverte o valor do port B
    PIR1.TMR2IF = 0; // limpa a flag de estouro do Timer 2
  }

}