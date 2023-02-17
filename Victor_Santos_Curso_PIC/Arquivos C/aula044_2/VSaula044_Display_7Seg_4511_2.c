
// Canal Vitor Santos
// aula044 - Display 7 Segmentos Parte 2
// usando CD4511 para economizar pinos
// criando biblioteca para usar qualquer pino nos barramentos de dados e direção



// --- inclusão de bibliotecas --- //
#include "display_4511.h"

// --- definições de parâmetros do sistema --- //

// pinos de dados
sbit display_4511_A at RB0_bit;
sbit display_4511_B at RB1_bit;
sbit display_4511_C at RB2_bit;
sbit display_4511_D at RB3_bit;
// direção
sbit display_4511_A_direction at TRISB0_bit;
sbit display_4511_B_direction at TRISB1_bit;
sbit display_4511_C_direction at TRISB2_bit;
sbit display_4511_D_direction at TRISB3_bit;


// --- protótipo das funções auxiliares --- //


// --- variáveis globais --- //
unsigned char i;

// --- programa principal --- //
void main() {
  display_4511_init();

  while(1){
    for(i=0; i < 9; i++){
      display_4511_out(i);
      delay_ms(300);
    }
  }

}

