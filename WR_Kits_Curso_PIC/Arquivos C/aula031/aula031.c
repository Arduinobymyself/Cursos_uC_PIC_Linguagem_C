// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                     Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:
            WR KITS - aula031 - PWM com PIC 16F877A
            Utilizando as bibliotecas do MikroC PRO for PIC

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define B1 RB1_bit
#define B2 RB2_bit
#define B3 RB3_bit
#define B4 RB4_bit


// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
unsigned short duty1, duty2;

// --- programa principal --- //
void main() {
  CMCON = 0X07; // desabilita os comparadores internos
  TRISB = 0XFF; // todo port B como entrada
  TRISC = 0x00; // todo port C como saída
  PORTB = 0XFF; // todo port B inicia em HIGH
  PORTC = 0X00; // todo port C inicia em LOW
  
  PWM1_Init(5000);
  PWM2_Init(5000);
  
  duty1 = 127;
  duty2 = 127;
  
  PWM1_Start();
  PWM2_Start();
  
  PWM1_Set_Duty(duty1);
  PWM2_Set_Duty(duty2);

  while(1)
  {
    if(!B1){
      delay_ms(50);
      duty1++;
      PWM1_Set_Duty(duty1);
    }
    if(!B2){
      delay_ms(50);
      duty1--;
      PWM1_Set_Duty(duty1);
    }
    if(!B3){
      delay_ms(50);
      duty2++;
      PWM2_Set_Duty(duty2);
    }
    if(!B4){
      delay_ms(50);
      duty2--;
      PWM2_Set_Duty(duty2);
    }
  }

}

// --- definição das funções auxiliares --- //