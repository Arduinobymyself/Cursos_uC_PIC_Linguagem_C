#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula056_I2C_DS1307.c"
#line 35 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula056_I2C_DS1307.c"
unsigned int valorDS = 0;

void main() {

 I2C1_Init(100000);
 I2C1_Start();


 I2C1_Wr(11010000);
 I2C1_Wr(0x04);
 I2C1_Wr(dec2Bcd(14));

 I2C1_Wr(0x05);
 I2C1_Wr(dec2Bcd(2));

 I2C1_Wr(0x06);
 I2C1_Wr(dec2Bcd(23));

 I2C1_Stop();
 delay_ms(100);



 I2C1_Start();
 I2C1_Wr(11010000);
 I2C1_Wr(0x06);
 I2C1_Repeated_Start();
 I2C1_Wr(11010001);
 valorDS = Bcd2Dec(I2C1_Rd(0));
 I2C1_Stop();
 delay_ms(1000);








 while(1){

 }


}
