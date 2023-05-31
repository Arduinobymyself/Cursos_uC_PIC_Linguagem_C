
#define B0 PORTB.RB0
#define B1 PORTB.RB1

int pwm_percent = 0;
int pwm_value = 0;


void main() {

  CMCON = 7;
  ADCON0 = 0;
  ADCON1 = 0;

  TRISB = 0b00000011;
  PORTB = 0b00000000;

  PWM1_Init(5000);       // inicializa o módulo PWM1 com frequência de 5000Hz
  PWM1_Start();          // ativa o PWM1 que usa o pino RC2

  //pwm_value = pwm_percent*255/100; // converte porcentagem em valor de 0~255

  PWM1_Set_Duty(pwm_value);    // define o duty-cycle

  while(1){
  
    if(B0 == 0){
    delay_ms(100);
      pwm_value += 10;
      if(pwm_value >= 255) pwm_value = 255;
      PWM1_Set_Duty(pwm_value);
    }
    
    if(B1 == 0){
      delay_ms(100);
      pwm_value -= 10;
      if(pwm_value <= 0) pwm_value = 0;
      PWM1_Set_Duty(pwm_value);
    }

  }




}