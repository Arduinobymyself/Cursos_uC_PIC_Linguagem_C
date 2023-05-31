#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/PWM_3_Controle_Com_Botoes/PWM_3_Controle_Com_Botoes.c"




int pwm_percent = 0;
int pwm_value = 0;


void main() {

 CMCON = 7;
 ADCON0 = 0;
 ADCON1 = 0;

 TRISB = 0b00000011;
 PORTB = 0b00000000;

 PWM1_Init(5000);
 PWM1_Start();



 PWM1_Set_Duty(pwm_value);

 while(1){

 if( PORTB.RB0  == 0){
 delay_ms(100);
 pwm_value += 10;
 if(pwm_value >= 255) pwm_value = 255;
 PWM1_Set_Duty(pwm_value);
 }

 if( PORTB.RB1  == 0){
 delay_ms(100);
 pwm_value -= 10;
 if(pwm_value <= 0) pwm_value = 0;
 PWM1_Set_Duty(pwm_value);
 }

 }




}
