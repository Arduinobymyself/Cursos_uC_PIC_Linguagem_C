// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:

            aula027 - Varredura de Bot�es com TIMER 0

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
  CMCON = 7; // desabilita os comparadores

  OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instru��o e prescaler 1:128
  
  INTCON.GIE = 1;  // habilita a interrup��o global
  INTCON.PEIE = 1; // habilita a interrup��o por perif�ricos
  INTCON.T0IE = 1; // habilita a interrup��o por estouro do Timer 0
  
  TMR0 = 0x6C;
  
  
  TRISA = 0X03; // RA0 e RA1 s�o entradas digitais
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

// --- defini��o das fun��es auxiliares --- //
void interrupt(){

  if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
    INTCON.T0IF = 0; // limpa a flag de estouro do Timer 0
    TMR0 = 0x6C; // reinicia o registrador TMR0

    // tarefa 2 - testar bot�es
    if(!S1){
      L1 = 1;
    }
    else if(!S2){
      L1 = 0;
    }

  }
}