// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

            aula028 - Varredura de Teclado Matricial - Timer 0

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define L1     RA3_bit
#define L2     RA2_bit
#define S1     RA1_bit
#define S2     RA0_bit
#define col_1  RB1_bit
#define col_2  RB2_bit
#define col_3  RB3_bit
#define row_A  RB4_bit
#define row_B  RB5_bit
#define row_C  RB6_bit
#define row_D  RB7_bit

// --- protótipo das funçãoes --- //
void interrupt();
void pulse(char number);

// --- variáveis globais --- //
char control = 1;

// --- programa principal --- //
void main() {
  CMCON = 7; // desabilita os comparadores

  OPTION_REG = 0b10000110; //(86h) - Timer 0 incrementa dom ciclo de instrução e prescaler 1:128

  INTCON.GIE = 1;  // habilita a interrupção global
  INTCON.PEIE = 1; // habilita a interrupção por periféricos
  INTCON.T0IE = 1; // habilita a interrupção por estouro do Timer 0

  TMR0 = 0x6C;     // TE = CM*PS*(256-TMR0) = 1us*128*(256-108) = 18,94ms


  TRISA = 0X03; // RA0 e RA1 são entradas digitais
  TRISB = 0XF0; // nibble mais significativo do port B serão entradas
  PORTA = 0X03; // RA0 e RA1 iniciam em HIGH
  PORTB = 0XFF; // port B inicia en nível lógico baixo
  



  while(1)
  {



  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(INTCON.T0IF == 1){ // se houve estouro do Timer 0
    INTCON.T0IF = 0;    // limpa a flag de estouro do Timer 0
    TMR0 = 0x6C;        // reinicia o registrador TMR0

    // rotina para varrer uma coluna por vez
    if(col_1 && control == 1){ // se é a vez da coluna 1
      control = 2; // passa a vez para a coluna 2
      col_1 = 0;   // aciona apenas a coluna 1
      col_2 = 1;
      col_3 = 1;
      if(!row_A) pulse(1);
      else if(!row_B) pulse(4);
      else if(!row_C) pulse(7);
      else if(!row_D) pulse(11);
    }
    if(col_2 && control == 2){ // se é a vez da coluna 2
      control = 3; // passa a vez para a coluna 3
      col_1 = 1;
      col_2 = 0;   // aciona apenas a coluna 2
      col_3 = 1;
      if(!row_A) pulse(2);
      else if(!row_B) pulse(5);
      else if(!row_C) pulse(8);
      else if(!row_D) pulse(10);
    }
    if(col_3 && control == 3){ // se é a vez da coluna 3
      control = 1; // passa a vez para a coluna 1
      col_1 = 1;
      col_2 = 1;
      col_3 = 0;   // aciona apenas a coluna 3
      if(!row_A) pulse(3);
      else if(!row_B) pulse(6);
      else if(!row_C) pulse(9);
      else if(!row_D) pulse(12);
    }


  }
}

void pulse(char number){ // pulsa o LED 1 de acordo com o número pressionado no teclado
  char i;
  for(i = 0; i < number; i++){
    L1 = 1;
    delay_ms(200);
    L1 = 0;
    delay_ms(200);
  }
}