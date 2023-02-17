#line 1 "C:/Documents and Settings/Usuario/Desktop/Aula PIC16F877A em C/Aula I2C e PCF8574/I2C e PCF8574.c"
#line 20 "C:/Documents and Settings/Usuario/Desktop/Aula PIC16F877A em C/Aula I2C e PCF8574/I2C e PCF8574.c"
char valor = 0;



void writePCF8574(char wdispositivo, char wvalor);



void main() {



 I2C1_Init(100000);



 TRISD = 0;
 PORTD = 0x01;



 for(;;)
 {

 writePCF8574(0,PORTD);
 Delay_ms(2000);

 }
}

void writePCF8574(char wdispositivo, char wvalor)
{

 I2C1_Start();
 I2C1_Wr((0b01000000) | (wdispositivo << 1));
 I2C1_Wr( wvalor );
 I2C1_Stop();
 Delay_ms(5);

}
