
/*
  I2C (Inter Integrated Circuit), � basicamente um protocolo de comunica��o
  entre dispositivos normalmente circuitos integrados.
  PCF8574 - expansor de pinos
  DS1307 - Real Time Clock
  24C02 - Memory
  etc...
  
  O barramento I2C � composto de dois fios SDA e SCL, alimenta��o VDD e GND
  tipicamente 3,3V ou 5V, os fios de comunica��o t�m resistores de pull-up.
  O n�mero de dispositivos em um barramento � limitado tanto pelo tamanho 
  do endere�o e a dist�ncia m�xima � de poucos metros.
  
  DS1307
  Trabalha em BCD
  ADDRESS - FUNCTION  - RANGE
  00h       seconds     00-59
  01h       minutes     00-59
  02h       hours       01-12 +AM/PM or 00-23
  03h       day         01-07
  04h       date        01-31
  05h       month       01-12
  06h       year        00-99
  07h       control     -----
  08h-3Fh   RAM         00-FFh
  
  endere�o 1101000  followed by the direction bit (R/W) write = 0
  
*/




unsigned int valorDS = 0;

void main() {

  I2C1_Init(100000);
  I2C1_Start();
  
  // escrita
  I2C1_Wr(11010000);      // escreve o endere�o do DS1307
  I2C1_Wr(0x04);          // escreve no endere�o do dia
  I2C1_Wr(dec2Bcd(14));   // escreve o dia 14
  
  I2C1_Wr(0x05);          // escreve no endere�o do m�s
  I2C1_Wr(dec2Bcd(2));   // escreve o m�s fevereiro
  
  I2C1_Wr(0x06);          // escreve no endere�o do ano
  I2C1_Wr(dec2Bcd(23));   // escreve o ano
  
  I2C1_Stop();
  delay_ms(100);
  
  
  // leitura
  I2C1_Start();
  I2C1_Wr(11010000);
  I2C1_Wr(0x06); // l� o ano
  I2C1_Repeated_Start(); // restarta
  I2C1_Wr(11010001);
  valorDS = Bcd2Dec(I2C1_Rd(0)); // l� e para, armazena na vari�vel
  I2C1_Stop();
  delay_ms(1000);
  
  
  
  

  


  while(1){
  
  }
  

}