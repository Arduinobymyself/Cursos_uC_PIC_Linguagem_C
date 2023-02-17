// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:
    Calculando Tempo de Estouro do Timer 0 (utilizando Interrup��o)
    Fosc -> 8MHz
    TempoEstouro(TE) = CicloM�quina(CM)*Prescaler(PS)*(256-ValorInicial(TMR0))
    TE = CM * PS * (256 - TMR0)
    TE = 0,5us * 256 * (256 - 0)
    TE = 32,768ms -> Tempo M�ximo de Estouro do Timer 0

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//

// --- prot�tipo das fun��oes --- //
void interrupt();

// --- vari�veis globais --- //
unsigned int cont = 0;
unsigned int tempo = 1000; // 1000 = 1000ms = 1s

// --- programa principal --- //
void main() {

  ADCON1 = 7;        // entradas nanal�gicas desabilitadas
  CMCON = 7;         // comparadores desabilitados

  INTCON.GIE = 1;    // habilita a chave geral de interrup��es
  INTCON.PEIE = 1;   // habilita a chave de interrup��es por perif�ricos (n�o necess�ria)
  INTCON.TMR0IE = 1; // habilita a interrup��o por Timer 0
  
  TRISD = 0; // PORT D como sa�da digital
  PORTD = 0; // PORT D iniciaem n�vel baixo

  OPTION_REG = 0b10000010;    // liga o Timer 0, prescaler 1:8
  TMR0 = 6;                   // carregamento do valor inicial do registrador
                              // incia contagem em 6 e vai at� 256 = 250 vezes
                              // at� ocorrer um estouro TE = 0,5us*8*(256-6)
                              // TE = 1ms
  INTCON.TMR0IF = 0;          // incializa o flag de estouro

  while(1){

      if(cont == tempo){        // para aumentar o tempo m�ximo TE*10 = 327,68ms

        // QUAL SERIA O VALOR DO CONTADOR PARA TE=1s ???

        PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0
        cont = 0;               // zera contador
      }
      
  }

}

// --- desenvolvimento das fun��es auxiliares --- //
void interrupt(){// se ocorreu estouro....
  cont++;            // a cada interrup��oincrementa a contagem
  TMR0 = 6;          // inicia o registrador TMR0 em 6, ou seja,
                     // conta de 6 a 256 = 250 vezes at� um estouro
  INTCON.TMR0IF = 0; // restaura o flag de estouro
}
