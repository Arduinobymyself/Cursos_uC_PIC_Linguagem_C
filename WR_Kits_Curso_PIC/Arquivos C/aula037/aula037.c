// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:

            aula037 - MODO SLEEP

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
bit control;

// --- programa principal --- //
void main() {
  CMCON = 0X07;
  OPTION_REG = 0b10001110; // RBPU = 1 (PullUp desabilitado), PSA = 1 (WDT), PS<2:0> = 110 (prescaler 1:128)
  INTCON.GIE = 1;
  INTCON.PEIE = 0;
  INTCON.INTE = 1;
  
  TRISA = 0b00000011;
  PORTA = 0b00000011;
  TRISB = 0b00000001;
  PORTB = 0b00000001;
  
  L1 = 0;
  L2 = 0;
  
  control = 0;

  while(1)
  {
    L1 = ~L1;
    delay_ms(500);
  }

}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){
  if(INTCON.INTF){
    INTCON.INTF = 0;
    control = ~control;
    L2 = ~L2;
    if(control){
      asm sleep; // coloca o uC em modo sleep
    }
  }
}