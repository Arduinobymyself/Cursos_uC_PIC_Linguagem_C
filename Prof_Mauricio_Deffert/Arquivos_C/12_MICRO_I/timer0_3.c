// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
    Calculando Tempo de Estouro do Timer 0 (utilizando Interrupção)
    Fosc -> 8MHz
    TempoEstouro(TE) = CicloMáquina(CM)*Prescaler(PS)*(256-ValorInicial(TMR0))
    TE = CM * PS * (256 - TMR0)
    TE = 0,5us * 256 * (256 - 0)
    TE = 32,768ms -> Tempo Máximo de Estouro do Timer 0

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //
unsigned int cont = 0;
unsigned int tempo = 1000; // 1000 = 1000ms = 1s

// --- programa principal --- //
void main() {

  ADCON1 = 7;        // entradas nanalógicas desabilitadas
  CMCON = 7;         // comparadores desabilitados

  INTCON.GIE = 1;    // habilita a chave geral de interrupções
  INTCON.PEIE = 1;   // habilita a chave de interrupções por periféricos (não necessária)
  INTCON.TMR0IE = 1; // habilita a interrupção por Timer 0
  
  TRISD = 0; // PORT D como saída digital
  PORTD = 0; // PORT D iniciaem nível baixo

  OPTION_REG = 0b10000010;    // liga o Timer 0, prescaler 1:8
  TMR0 = 6;                   // carregamento do valor inicial do registrador
                              // incia contagem em 6 e vai até 256 = 250 vezes
                              // até ocorrer um estouro TE = 0,5us*8*(256-6)
                              // TE = 1ms
  INTCON.TMR0IF = 0;          // incializa o flag de estouro

  while(1){

      if(cont == tempo){        // para aumentar o tempo máximo TE*10 = 327,68ms

        // QUAL SERIA O VALOR DO CONTADOR PARA TE=1s ???

        PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0
        cont = 0;               // zera contador
      }
      
  }

}

// --- desenvolvimento das funções auxiliares --- //
void interrupt(){// se ocorreu estouro....
  cont++;            // a cada interrupçãoincrementa a contagem
  TMR0 = 6;          // inicia o registrador TMR0 em 6, ou seja,
                     // conta de 6 a 256 = 250 vezes até um estouro
  INTCON.TMR0IF = 0; // restaura o flag de estouro
}
