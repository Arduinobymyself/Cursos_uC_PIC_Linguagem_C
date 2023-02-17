// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
    Calculando Tempo de Estouro do Timer 0
    Fosc -> 8MHz
    TempoEstouro(TE) = CicloMáquina(CM)*Prescaler(PS)*(256-ValorInicial(TMR0))
    TE = CM * PS * (256 - TMR0)
    TE = 0,5us * 256 * (256 - 0)
    TE = 32,768ms -> Tempo Máximo de Estouro do Timer 0

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  TRISD = 0;
  PORTD = 0;
  
  OPTION_REG = 0b10000111;    // liga o Timer 0, prescaler 1:256
  TMR0 = 0;                   // carregamento do valor inicial do registrador
  INTCON.TMR0IF = 0;          // incializa o flag de estouro
  
  while(1){
    if(INTCON.TMR0IF == 1){   // se ocorreu estouro...
      PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0
      TMR0 = 0;               // inicializa o valor do registrador
      INTCON.TMR0IF = 0;      // restaura o flag de estouro
    }
  }

}

// --- definição das funções auxiliares --- //