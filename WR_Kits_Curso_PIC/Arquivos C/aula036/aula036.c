// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
  
            aula036 - WATCHDOG TIMER

*/


// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L0 RB0_bit
#define L7 RB7_bit


// --- protótipo das funçãoes --- //

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0X07;
  OPTION_REG = 0b10001110; // RBPU = 1 (PullUp desabilitado), PSA = 1 (WDT), PS<2:0> = 110 (prescaler 1:128)
  
  TRISB = 0;
  PORTB = 0;
  
  L7 = 1;
  
  asm clrwdt; // comando assembly para limpar o WDT

  while(1)
  {
    asm clrwdt;
    L0 = ~L0;
    delay_ms(300);
  }

}

// --- definição das funções auxiliares --- //