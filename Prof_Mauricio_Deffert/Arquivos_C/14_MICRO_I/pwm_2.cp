#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/pwm_2.c"








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
