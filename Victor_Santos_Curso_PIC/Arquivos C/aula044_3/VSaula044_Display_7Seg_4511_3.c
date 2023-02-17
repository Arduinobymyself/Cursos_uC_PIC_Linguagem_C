
// Canal Vitor Santos
// aula044 - Display 7 Segmentos Parte 2
// usando CD4511 para economizar pinos
// criando biblioteca para usar qualquer pino nos barramentos de dados e direção



// --- inclusão de bibliotecas --- //
#include "display_4x_4511.h"

// --- definições de parâmetros do sistema --- //

// pinos de dados
sbit display_4511_A at RB0_bit;
sbit display_4511_B at RB1_bit;
sbit display_4511_C at RB2_bit;
sbit display_4511_D at RB3_bit;
// pinos de controle
sbit display_4511_disp1 at RD0_bit;
sbit display_4511_disp2 at RD1_bit;
sbit display_4511_disp3 at RD2_bit;
sbit display_4511_disp4 at RD3_bit;

// direção pinos de dados
sbit display_4511_A_direction at TRISB0_bit;
sbit display_4511_B_direction at TRISB1_bit;
sbit display_4511_C_direction at TRISB2_bit;
sbit display_4511_D_direction at TRISB3_bit;
// direção pinos de controle
sbit display_4511_disp1_direction at TRISD0_bit;
sbit display_4511_disp2_direction at TRISD1_bit;
sbit display_4511_disp3_direction at TRISD2_bit;
sbit display_4511_disp4_direction at TRISD3_bit;


// --- protótipo das funções auxiliares --- //
void initTimer0();
void interrupt();

// --- variáveis globais --- //
unsigned char i;
unsigned int contador = 5678;

// --- programa principal --- //
void main() {
  initTimer0();
  display_4511_init();

  while(1){
    delay_ms(500);
    contador++;
  }

}

void initTimer0(){
  OPTION_REG	 = 0x83;
  TMR0		 = 6;
  INTCON	 = 0xA0;
}

void interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit	 = 0;
    TMR0         = 6;
    display_4511_sweep(contador);
  }
}


