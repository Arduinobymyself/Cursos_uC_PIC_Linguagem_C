

void main()
{//Inicio da main
  I2C1_Init(100000);
  TRISD = 0;
  PORTD = 0;
  TRISB0_bit = 1;

  //Write
  I2C1_Start();
  I2C1_Wr(0b01000010); // 7 bits de endereço, último bit em 0 -> escrita
  I2C1_Wr(0b01000001); //escreve em P7 ... P0
  I2C1_Stop();


  //Read
  I2C1_Start();
  I2C1_Wr(0b01000001); // 7 bits de endereço, último bit em 1 -> leitura
  PORTD = I2C1_Rd(0);  // faz a leitura e envia ao PORT D
  I2C1_Stop();


  while(1){//Inicio do Loop

    if(!RB0_bit){
      //Read
      I2C1_Start();
      I2C1_Wr(0b01000001);
      PORTD = I2C1_Rd(0);
      I2C1_Stop();
      delay_ms(5);
    }

  }//Final do Loop
  
}//Final da main