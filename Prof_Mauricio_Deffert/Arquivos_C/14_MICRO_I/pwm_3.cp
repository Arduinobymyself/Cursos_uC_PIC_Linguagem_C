#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/pwm_3.c"










int dutyCycle = 0;

void main() {

 TRISB = 0xFF;
 PORTB = 0xFF;
 TRISC = 0;
 TRISD = 0;
 PORTC = 0;
 PORTD = 0;

 PWM1_Init(1000);
 PWM1_Start();

 while(1){
 if(! RB0_bit ){
 dutyCycle += 25;
 if(dutyCycle > 255) dutyCycle = 250;
 PWM1_Set_Duty(dutyCycle);
 }
 if(! RB1_bit ){
 dutyCycle -= 25;
 if(dutyCycle < 0) dutyCycle = 0;
 PWM1_Set_Duty(dutyCycle);
 }
 PORTD = dutyCycle;
 delay_ms(200);
 }

}
