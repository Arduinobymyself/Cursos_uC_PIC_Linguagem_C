#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula032.c"
#line 33 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula032.c"
unsigned short int percent_duty;
unsigned int ADC = 0;


void main() {
 CMCON = 0X07;
 ADCON0 = 0b00000001;
 ADCON1 = 0b00001110;

 TRISB = 0XFF;
 TRISC = 0x00;
 PORTB = 0XFF;
 PORTC = 0X00;

 PWM1_Init(1000);

 percent_duty = 50;

 PWM1_Start();

 PWM1_Set_Duty(percent_duty*255/100);


 while(1)
 {
 ADC = ADC_Read(0);
 PWM1_Set_Duty(ADC*255/100);
 if(ADC < 512 ){
 percent_duty++;
 delay_ms(50);
 if(percent_duty > 90) percent_duty = 90;
 } else {
 percent_duty = 80;
 }
 }

}
