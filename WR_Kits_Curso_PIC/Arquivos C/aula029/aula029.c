// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                     Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:

            Aula029 - TIMER 2

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define L1 RA3_bit
#define L2 RA2_bit
#define S1 RA1_bit
#define S2 RA0_bit

// --- prot�tipo das fun��oes --- //
void interrupt();

// --- vari�veis globais --- //

// --- programa principal --- //
void main() {

  INTCON.GIE = 1; // habilita a interrup��o global
  INTCON.PEIE = 1; // habilita a interrup��o por perif�ricos
  PIE1.TMR2IE = 1; // habilita interrup��o do Timer 2 por compara��o TMR2 com PR2
  T2CON = 0b00011101; // (0), (0011) postscaler 1:4, (1) Timer 2 habilitado, (01) prescaler 1:4
  PR2 = 100; //
  TRISB = 0; // todo port B como sa�da
  PORTB = 0; // port B inciando em n�vel baixo

  // CM - Ciclo de M�quina
  // CM = Fosc/4
  // PS - PreScaler
  // PSTS - PoSTScaler
  // TE - Tempo de Estouro
  // PR2 - registrador de conpara��o do Timer 2
  // TE = CM*PR2*PS*PSTS = 1us*100*4*4 = 1,6ms

  while(1){

  }

}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){

  if(PIR1.TMR2IF){ // se houve estouro do Timer 2
    PORTB = ~PORTB; // inverte o valor do port B
    PIR1.TMR2IF = 0; // limpa a flag de estouro do Timer 2
  }

}