#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/PWM_2_Biblioteca/PWM_2.c"

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

 PWM1_Init(5000);
 PWM1_Start();

 pwm_value = pwm_percent*255/100;

 PWM1_Set_Duty(pwm_value);

 while(1){
 piscaLed();
 }




}
