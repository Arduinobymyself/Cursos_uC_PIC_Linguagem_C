/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descrição do Projeto:

            aula040 - PIC16F876A, TEMPORIZAÇÃO - TIMER1
            Fosc = 16MHz
            CM = Fosc/4 = 250ns
            TE = CM*PS*(65536 - TRM1)
            TE = 250ns*1*65536 = 16,384ms
            TEmax = TE*8 = 131,072ms

*/


// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0b00000111;   // desabilita comparadores internos
  
  T1CON = 0b00110001;   // prescaler 1:8, Timer1 On
  
  TMR1H = 0;            // Timer1 inicia em 0
  TMR1L = 0;
  
  TRISC = 0;
  PORTC = 0;
  
  while(1){
    if(TMR1IF_bit){
      TMR1IF_bit = 0;
      RC4_bit = ~RC4_bit; // inverte o estado a cada 16ms (prescaler 1:1)
    }
  }




}

// --- definição das funções auxiliares --- //

