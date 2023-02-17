#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula031.c"
#line 31 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula031.c"
unsigned short duty1, duty2;


void main() {
 CMCON = 0X07;
 TRISB = 0XFF;
 TRISC = 0x00;
 PORTB = 0XFF;
 PORTC = 0X00;

 PWM1_Init(5000);
 PWM2_Init(5000);

 duty1 = 127;
 duty2 = 127;

 PWM1_Start();
 PWM2_Start();

 PWM1_Set_Duty(duty1);
 PWM2_Set_Duty(duty2);

 while(1)
 {
 if(! RB1_bit ){
 delay_ms(50);
 duty1++;
 PWM1_Set_Duty(duty1);
 }
 if(! RB2_bit ){
 delay_ms(50);
 duty1--;
 PWM1_Set_Duty(duty1);
 }
 if(! RB3_bit ){
 delay_ms(50);
 duty2++;
 PWM2_Set_Duty(duty2);
 }
 if(! RB4_bit ){
 delay_ms(50);
 duty2--;
 PWM2_Set_Duty(duty2);
 }
 }

}
