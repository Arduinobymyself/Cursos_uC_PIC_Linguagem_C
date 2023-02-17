#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula058_I2C_PCF8574_IO_2.c"
#line 25 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula058_I2C_PCF8574_IO_2.c"
char valor = 0;



void writePCF8574(char wdispositivo, char wvalor);




void main() {



 I2C1_Init(100000);



 TRISD = 0;
 PORTD = 0x01;



 while(1){

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
