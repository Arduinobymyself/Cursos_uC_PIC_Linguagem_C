// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descri��o do Projeto:
    Modo Contador do Timer 0 (contagem de at� 10 eventos)
    Fosc -> 8MHz
    TMR0 = 256 - 10 = 246

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //
char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

// --- programa principal --- //
void main() {

  ADCON1 = 7;        // entradas nanal�gicas desabilitadas
  CMCON = 7;         // comparadores desabilitados

  TRISA.RA4 = 1;     // pino T0CKI configurado como entrada
                     // esse pino normalmente � dreno aberto, neste caso �
                     // necess�rio resistores de pull-up externo
  TRISD = 0; // PORT D como sa�da digital
  PORTD = 0; // PORT D iniciaem n�vel baixo
  TRISC.RC4 = 0;
  PORTC.RC4 = 1; // aciona display 1
  

  OPTION_REG = 0b10111000;    // modo contador, prescaler desligado, borda descida
  TMR0 = 246;                 // carregamento do valor inicial do registrador
                              // incia contagem em 246 e vai at� 256 = 10 vezes
                              // conta 10 eventos
  INTCON.TMR0IF = 0;          // incializa o flag de estouro

  while(1){

      PORTD = digitos[(10 - (256 - TMR0))]; // ***modifica��o adicionada***
                                            // envia o digito ao display
                                            
      if(INTCON.TMR0IF == 1){ // se houve estouro...
        //PORTD.RD0 = ~PORTD.RD0; // inverte o estado do LED 0 *modificado*
        TMR0 = 246;
        INTCON.TMR0IF = 0;
      }

  }

}

// --- desenvolvimento das fun��es auxiliares --- //

