// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descri��o do Projeto:

            aula039 - PIC16F876A, INTERRUP��O POR TRANSI��O NO PORTB

*/


// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define S1 RB4_bit
#define S2 RB5_bit
#define S3 RB6_bit
#define S4 RB7_bit


// --- prot�tipo das fun��oes --- //
void interrupt();

// --- vari�veis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0b00000111;   // desabilita comparadores internos

  GIE_bit = 1;          // habilita interrup��o global
  PEIE_bit = 1;         // habilita interrup��o por perif�ricos
  RBIE_bit = 1;         // habilita interrup��o por comparadores

  TRISB = 0b11110000;   // port B nibble MSB como entrada digital
  PORTB = 0b11110000;   // port B nibble MSB com pull-up
  TRISC = 0b00000000;   // port C como sa�da digital
  PORTC = 0b00000000;   // port C inicia em n�vel baixo



}

// --- defini��o das fun��es auxiliares --- //
void interrupt(){
  if(RBIF_bit){     // testa flag de interrup��o
    RBIF_bit = 0;   // limpa flag de interrup��o
    RC4_bit = ~RC4_bit;
    delay_us(500);
  }
}