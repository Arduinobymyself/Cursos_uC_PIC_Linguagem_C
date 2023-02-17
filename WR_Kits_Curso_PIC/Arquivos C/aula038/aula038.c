// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descri��o do Projeto:

            aula038 - PIC16F876A, COMPARADORES E INTERRUP��ES

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
  CMCON = 0b00000010;   // habilita comparadores 1 e 2 modo Two Independent Comparators
                        // RA0(-) RA3(+) C1OUT

  GIE_bit = 1;          // habilita interrup��o global
  PEIE_bit = 1;         // habilita interrup��o por perif�ricos
  CMIE_bit = 1;         // habilita interrup��o por comparadores

  TRISA = 0b00001111;   // nible LSB como entrada
  TRISB = 0;
  PORTB = 0;






}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){
  if(CMIF_bit){     // testa flag de interrup��o
    CMIF_bit = 0;   // limpa flag de interrup��o
    if(C1OUT_bit){  // verifica flag de sa�da do comparador
      RB3_bit = 1;  // se alto
    } else {
      RB3_bit = 0;  // se baixo
    }
  }
}