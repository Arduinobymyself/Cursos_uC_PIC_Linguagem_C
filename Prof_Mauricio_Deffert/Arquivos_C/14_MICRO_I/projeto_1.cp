#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/projeto_1.c"
#line 14 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/14_MICRO_I/projeto_1.c"
int dutyCycle1 = 0;
int dutyCycle2 = 0;

void main() {

 TRISB = 0xFF;
 PORTB = 0xFF;
 TRISC = 0;
 TRISD = 0;
 PORTC = 0;
 PORTD = 0;

 PWM1_Init(1000);
 PWM1_Start();
 PWM2_Init(1000);
 PWM2_Start();

 while(1){

 if(! RB0_bit ){
 dutyCycle1 += 25;
 if(dutyCycle1 > 255) dutyCycle1 = 250;
 PWM1_Set_Duty(dutyCycle1);
 }
 if(! RB1_bit ){
 dutyCycle1 -= 25;
 if(dutyCycle1 < 0) dutyCycle1 = 0;
 PWM1_Set_Duty(dutyCycle1);
 }

 if(! RB2_bit ){
 dutyCycle2 += 25;
 if(dutyCycle2 > 255) dutyCycle2 = 250;
 PWM2_Set_Duty(dutyCycle2);
 }
 if(! RB3_bit ){
 dutyCycle2 -= 25;
 if(dutyCycle2 < 0) dutyCycle2 = 0;
 PWM2_Set_Duty(dutyCycle2);
 }

 delay_ms(100);
 }

}
