// Exemplo 03 - Configura��o PWM
// B0 incrementa PWM1 e B1 decrementa PWM1 com passos de 10%



#define PWM1 RC2_bit
#define PWM2 RC1_bit
#define B0 RB0_bit
#define B1 RB1_bit

int dutyCycle = 0;

void main() {

  TRISB = 0xFF;
  PORTB = 0xFF;
  TRISC = 0;
  TRISD = 0;
  PORTC = 0;
  PORTD = 0;

  PWM1_Init(1000); // inicializa o m�dulo PWM com frequ�ncia 1KHz
  PWM1_Start();   // icnia a gera��o do PWM

  while(1){
    if(!B0){
      dutyCycle += 25;
      if(dutyCycle > 255) dutyCycle = 250;
      PWM1_Set_Duty(dutyCycle);
    }
    if(!B1){
      dutyCycle -= 25;
      if(dutyCycle < 0) dutyCycle = 0;
      PWM1_Set_Duty(dutyCycle);
    }
    PORTD = dutyCycle;
    delay_ms(200); // debounce
  }

}