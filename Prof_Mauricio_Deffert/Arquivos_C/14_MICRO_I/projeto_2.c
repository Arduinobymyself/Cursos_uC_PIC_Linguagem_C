// Projeto 2 - Configuração PWM
// CI L293 controle de motor DC
// Potenciômetro ligado a AN0(RA0) controla a velocidade do motor via PWM1
// B0 - rotação à direita IN1(RC3)
// B1 - rotação à esquerda IN2(RC4)
// B2 - para o motor


#define PWM1 RC2_bit
#define PWM2 RC1_bit

#define B0 RB0_bit
#define B1 RB1_bit
#define B2 RB2_bit

bit flagB0, flagB1, flagB2;
unsigned int leitura = 0;

void main() {

  TRISA = 0xFF;
  TRISB = 0xFF;
  PORTB = 0xFF;
  TRISC = 0;
  PORTC = 0;

  ADC_Init();
  
  PWM1_Init(500); // inicializa o módulo PWM com frequência 1KHz
  PWM1_Start();    // icnia a geração do PWM

  while(1){
  
    leitura = ADC_Read(0)/4;
    
    PWM1_Set_Duty(leitura);
    
    if(!B0 && !flagB0){
      flagB0 = 1;
    }
    if(B0 && flagB0){
      flagB0 = 0;
      RC3_bit = 1;
      RC4_bit = 0;
    }

    if(!B1 && !flagB1){
      flagB1 = 1;
    }
    if(B1 && flagB1){
      flagB1 = 0;
      RC3_bit = 0;
      RC4_bit = 1;
    }

    if(!B2 && !flagB2){
      flagB2 = 1;
    }
    if(B2 && flagB2){
      flagB2 = 0;
      RC3_bit = 0;
      RC4_bit = 0;
    }
    
  }

}