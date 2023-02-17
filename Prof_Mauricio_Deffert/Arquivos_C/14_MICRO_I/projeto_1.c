// Projeto 1 - Configuração PWM
// B0 incrementa PWM1 e B1 decrementa PWM1 com passos de 10%
// B2 incrementa PWM2 e B3 decrementa PWM2 com passos de 10%


#define PWM1 RC2_bit
#define PWM2 RC1_bit

#define B0 RB0_bit
#define B1 RB1_bit
#define B2 RB2_bit
#define B3 RB3_bit

int dutyCycle1 = 0;
int dutyCycle2 = 0;

void main() {

  TRISB = 0xFF;
  PORTB = 0xFF;
  TRISC = 0;
  TRISD = 0;
  PORTC = 0;
  PORTD = 0;

  PWM1_Init(1000); // inicializa o módulo PWM com frequência 1KHz
  PWM1_Start();    // icnia a geração do PWM
  PWM2_Init(1000); // inicializa o módulo PWM com frequência 1KHz
  PWM2_Start();    // icnia a geração do PWM

  while(1){
  
    if(!B0){
      dutyCycle1 += 25;
      if(dutyCycle1 > 255) dutyCycle1 = 250;
      PWM1_Set_Duty(dutyCycle1);
    }
    if(!B1){
      dutyCycle1 -= 25;
      if(dutyCycle1 < 0) dutyCycle1 = 0;
      PWM1_Set_Duty(dutyCycle1);
    }
    
    if(!B2){
      dutyCycle2 += 25;
      if(dutyCycle2 > 255) dutyCycle2 = 250;
      PWM2_Set_Duty(dutyCycle2);
    }
    if(!B3){
      dutyCycle2 -= 25;
      if(dutyCycle2 < 0) dutyCycle2 = 0;
      PWM2_Set_Duty(dutyCycle2);
    }
    
    delay_ms(100); // debounce
  }

}