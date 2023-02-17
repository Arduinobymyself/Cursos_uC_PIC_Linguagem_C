// Exemplo 01 - Configuração PWM
// Incrementa Duty-Cycle a cada 20ms



#define PWM1 RC2_bit
#define PWM2 RC1_bit

unsigned short i;

void main() {

  TRISC = 0;
  TRISD = 0;
  PORTC = 0;
  PORTD = 0;
  
  PWM1_Init(500);
  PWM1_Start();
  
  while(1){
    for(i=0; i<255; i++){
      PWM1_Set_Duty(i);
      PORTD = i;
      delay_ms(20);
    }
  }
  
  

}