
int pwm_percent = 25;
int pwm_value = 0;

void piscaLed(){
  PORTD.RD0 = 1;
  delay_ms(500);
  PORTD.RD0 = 0;
  delay_ms(500);
}


void main() {

  CMCON = 7;
  ADCON0 = 0;
  ADCON1 = 0;
  
  TRISD = 0;
  PORTD = 0;
  
  PWM1_Init(5000);       // inicializa o módulo ´WM com frequência de 5000Hz
  PWM1_Start();          // ativa o PWM
  
  pwm_value = pwm_percent*255/100; // converte porcentagem em valor de 0~255
  
  PWM1_Set_Duty(pwm_value);    // define o duty-cycle

  while(1){
    piscaLed(); // pisca um LED mesmo com o controle de PWM ativado
  }

  


}