#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula051_CCP_PWM_Library.c"
#line 37 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula051_CCP_PWM_Library.c"
unsigned int tempo =0, freq = 0;
unsigned char texto[16];
short int flag = 0b00000001;


void main() {

 TRISC = 0b00000000;
 PORTC = 0b00000000;

 PWM2_Init(2000);
 PWM2_Set_Duty(127);
 PWM2_Start();
 delay_ms(3000);
 PWM2_Set_Duty(0);
 delay_ms(5);
 PWM2_Stop();






 while(1){



 }

}
