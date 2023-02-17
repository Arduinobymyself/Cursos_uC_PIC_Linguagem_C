/*
----------------------- ADDRESS -----------------------
24C32A |  A2 |  A1 |  A0 | DISP
       |  0  |  0  |   0 |   0x00
       |  0  |  0  |   1 |   0x01
       |  0  |  1  |   0 |   0x02
       |  0  |  1  |   1 |   0x03
       |  1  |  0  |   0 |   0x04
       |  1  |  0  |   1 |   0x05
       |  1  |  1  |   0 |   0x06
       |  1  |  1  |   1 |   0x07
-------------------------------------------------------



       
       
*/

void write24C32A(char wdevice, char w24C32A_reg, char w24C32A_value){
  
  I2C1_Start();        // inicia comunicação
  I2C1_Wr((0b10100000) | (wdevice << 1));
  I2C1_Wr(w24C32A_reg >> 4);
  I2C1_Wr(w24C32A_reg &  0x0F);
  I2C1_Wr(w24C32A_value);
  I2C1_Stop();
  delay_ms(5);
}

char read24C32A(char rdevice, char r24C32A_reg){

  char r24C32A_value;
  I2C1_Start();
  I2C1_Wr((0b10100000) | (rdevice << 1));
  I2C1_Wr(r24C32A_reg >> 4);
  I2C1_Wr(r24C32A_reg &  0x0F);
  I2C1_repeated_Start();
  I2C1_Wr((0b10100001) | (rdevice << 1));
  r24C32A_value = I2C1_Rd(0);
  I2C1_Stop();
  delay_ms(5);
  return  r24C32A_value;

}


void write24C32A_text(char wdevice, char w24C32A_reg, char *w24C32A_text){

  while(*w24C32A_text != '\0'){
    write24C32A(wdevice, w24C32A_reg, *w24C32A_text);
    w24C32A_reg++;
    w24C32A_text++;
  }
}

void read24C32A_text(char rdevice, char r24C32A_reg, char *r24C32A_text, char r24C32A_chr){

  char rauxtxt;
  while(rauxtxt != r24C32A_chr){
    *r24C32A_text = read24C32A(rdevice, r24C32A_reg);
    rauxtxt = *r24C32A_text;
    r24C32A_reg++;
    r24C32A_text++;
  }
  
}
