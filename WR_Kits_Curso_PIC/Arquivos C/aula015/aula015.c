// --- Cabeçalho do programa --- //
/*
Nome do Projeto:
Autor:                   Marcelo Moraes
Local:                   Sorocaba - SP
Data:                    Jan 2023
MCU:                     PIC16F628A
Descrição do Projeto:
	 Aula 015 - Curso PIC - Mikro C Pro Compiler
	 Multiplexação
	 Multiplexando dois LEDs a uma frequencia
	 imperceptível ao olho humano.
	 Proteus - Plataforma PARADOXUS 9
*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L1 RA3_bit
#define L2 RA2_bit
#define S1 RA1_bit
#define S2 RA0_bit

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //

// --- programa principal --- //
void main() {
  CMCON = 0X07;
  TRISA = 0X03; // RA0 e RA1 são entradas digitais
  PORTA = 0X03; // RA0 e RA1 iniciam em HIGH

  while(1){
    L1 = 1;
    L2 = 0;
    delay_ms(10);
    L1 = 0;
    L2 = 1;
    delay_ms(10);
  }

}

// --- definição das funções auxiliares --- //
