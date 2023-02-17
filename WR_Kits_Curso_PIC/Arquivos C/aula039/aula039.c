// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F876A
  Descrição do Projeto:

            aula039 - PIC16F876A, INTERRUPÇÃO POR TRANSIÇÃO NO PORTB

*/


// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define S1 RB4_bit
#define S2 RB5_bit
#define S3 RB6_bit
#define S4 RB7_bit


// --- protótipo das funçãoes --- //
void interrupt();

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0b00000111;   // desabilita comparadores internos

  GIE_bit = 1;          // habilita interrupção global
  PEIE_bit = 1;         // habilita interrupção por periféricos
  RBIE_bit = 1;         // habilita interrupção por comparadores

  TRISB = 0b11110000;   // port B nibble MSB como entrada digital
  PORTB = 0b11110000;   // port B nibble MSB com pull-up
  TRISC = 0b00000000;   // port C como saída digital
  PORTC = 0b00000000;   // port C inicia em nível baixo



}

// --- definição das funções auxiliares --- //
void interrupt(){
  if(RBIF_bit){     // testa flag de interrupção
    RBIF_bit = 0;   // limpa flag de interrupção
    RC4_bit = ~RC4_bit;
    delay_us(500);
  }
}