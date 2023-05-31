#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/MotorDC_PWM_Buttons/MotorDC_PWM_Buttons.c"
#line 12 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/MotorDC_PWM_Buttons/MotorDC_PWM_Buttons.c"
int valorPWM = 0, porcentagem = 0;
bit flagB0;
bit flagB1;

void main() {
 CMCON = 7;

 ADCON0 = 0;
 ADCON1 = 7;
 TRISB = 0b00000011;



 PWM1_Init(5000);
 PWM1_Start();
 PWM1_Set_Duty(valorPWM);

 while(1){

 if( Button(&PORTB, 0, 50, 1)  && flagB0 == 0){
 flagB0 = 1;
 }
 if(! Button(&PORTB, 0, 50, 1)  && flagB0 == 1){
 flagB0 = 0;
 porcentagem += 10;
 if(porcentagem > 100){
 porcentagem = 100;
 }
 valorPWM = (porcentagem*255)/100;
 PWM1_Set_Duty(valorPWM);
 }

 if( Button(&PORTB, 1, 50, 1)  && flagB1 == 0){
 flagB1 = 1;
 }
 if(! Button(&PORTB, 1, 50, 1)  && flagB1 == 1){
 flagB1 = 0;
 porcentagem -= 10;
 if(porcentagem < 0){
 porcentagem = 0;
 }
 valorPWM = (porcentagem*255)/100;
 PWM1_Set_Duty(valorPWM);
 }

 }







}
