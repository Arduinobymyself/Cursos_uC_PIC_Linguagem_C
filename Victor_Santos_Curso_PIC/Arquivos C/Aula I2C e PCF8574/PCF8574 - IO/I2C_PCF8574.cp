#line 1 "C:/Documents and Settings/Usuario/Desktop/Aula PIC16F877A em C/Aula I2C e PCF8574/PCF8574 - IO/I2C_PCF8574.c"


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


 for(;;)
 {

 if(RB0_bit == 0)
 {

 I2C1_Start();
 I2C1_Wr(0b01000001);
 PORTD = I2C1_Rd(0);
 I2C1_Stop();
 delay_ms(5);
 }

 }
}
