// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            aula027 - Varredura de Botões com TIMER 0

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
  CMCON = 7; // desabilita os comparadores

  OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instrução e prescaler 1:128
  
  INTCON.GIE = 1;  // habilita a interrupção global
  INTCON.PEIE = 1; // habilita a interrupção por periféricos
  INTCON.T0IE = 1; // habilita a interrupção por estouro do Timer 0
  
  TMR0 = 0x6C;
  
  
  TRISA = 0X03; // RA0 e RA1 são entradas digitais
  PORTA = 0X03; // RA0 e RA1 iniciam em HIGH



  while(1)
  {
  
    // tarefa 1 - piscar LED
    L2 = 0;
    delay_ms(500);
    L2 = 1;
    delay_ms(500);
    
  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
    INTCON.T0IF = 0; // limpa a flag de estouro do Timer 0
    TMR0 = 0x6C; // reinicia o registrador TMR0

    // tarefa 2 - testar botões
    if(!S1){
      L1 = 1;
    }
    else if(!S2){
      L1 = 0;
    }

  }
}