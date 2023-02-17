#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula058_I2C_PCF8574_IO.c"


void main()
{
 I2C1_Init(100000);
 TRISD = 0;
 PORTD = 0;
 TRISB0_bit = 1;


 I2C1_Start();
 I2C1_Wr(0b01000010);
 I2C1_Wr(0b01000001);
 I2C1_Stop();



 I2C1_Start();
 I2C1_Wr(0b01000001);
 PORTD = I2C1_Rd(0);
 I2C1_Stop();


 while(1){

 if(!RB0_bit){

 I2C1_Start();
 I2C1_Wr(0b01000001);
 PORTD = I2C1_Rd(0);
 I2C1_Stop();
 delay_ms(5);
 }

 }

}
