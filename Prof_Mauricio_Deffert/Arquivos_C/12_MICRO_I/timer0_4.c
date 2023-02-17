// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
    Modo Contador do Timer 0 (contagem de até 10 eventos)
    Fosc -> 8MHz
    TMR0 = 256 - 10 = 246

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

// --- programa principal --- //
void main() {

  ADCON1 = 7;        // entradas nanalógicas desabilitadas
  CMCON = 7;         // comparadores desabilitados

  TRISA.RA4 = 1;     // pino T0CKI configurado como entrada
                     // esse pino normalmente é dreno aberto, neste caso é
                     // necessário resistores de pull-up externo
  TRISD = 0; // PORT D como saída digital
  PORTD = 0; // PORT D iniciaem nível baixo
  TRISC.RC4 = 0;
  PORTC.RC4 = 1; // aciona display 1
  

  OPTION_REG = 0b10111000;    // modo contador, prescaler desligado, borda descida
  TMR0 = 246;                 // carregamento do valor inicial do registrador
                              // incia contagem em 246 e vai até 256 = 10 vezes
                              // conta 10 eventos
  INTCON.TMR0IF = 0;          // incializa o flag de estouro

  while(1){

      PORTD = digitos[(10 - (256 - TMR0))]; // ***modificação adicionada***
                                            // envia o digito ao display
                                            
      if(INTCON.TMR0IF == 1){ // se houve estouro...
        //PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0 *modificado*
        TMR0 = 246;
        INTCON.TMR0IF = 0;
      }

  }

}

// --- desenvolvimento das funções auxiliares --- //

