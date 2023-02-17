
/*
  I2C (Inter Integrated Circuit), é basicamente um protocolo de comunicação
  entre dispositivos normalmente circuitos integrados.
  PCF8574 - expansor de pinos
  DS1307 - Real Time Clock
  24C02 - Memory
  etc...
  
  O barramento I2C é composto de dois fios SDA e SCL, alimentação VDD e GND
  tipicamente 3,3V ou 5V, os fios de comunicação têm resistores de pull-up.
  O número de dispositivos em um barramento é limitado tanto pelo tamanho 
  do endereço e a distência máxima é de poucos metros.
  
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
  
  endereço 1101000  followed by the direction bit (R/W) write = 0
  
*/




unsigned int valorDS = 0;

void main() {

  I2C1_Init(100000);
  I2C1_Start();
  
  // escrita
  I2C1_Wr(11010000);      // escreve o endereço do DS1307
  I2C1_Wr(0x04);          // escreve no endereço do dia
  I2C1_Wr(dec2Bcd(14));   // escreve o dia 14
  
  I2C1_Wr(0x05);          // escreve no endereço do mês
  I2C1_Wr(dec2Bcd(2));   // escreve o mês fevereiro
  
  I2C1_Wr(0x06);          // escreve no endereço do ano
  I2C1_Wr(dec2Bcd(23));   // escreve o ano
  
  I2C1_Stop();
  delay_ms(100);
  
  
  // leitura
  I2C1_Start();
  I2C1_Wr(11010000);
  I2C1_Wr(0x06); // lê o ano
  I2C1_Repeated_Start(); // restarta
  I2C1_Wr(11010001);
  valorDS = Bcd2Dec(I2C1_Rd(0)); // lê e para, armazena na variável
  I2C1_Stop();
  delay_ms(1000);
  
  
  
  

  


  while(1){
  
  }
  

}