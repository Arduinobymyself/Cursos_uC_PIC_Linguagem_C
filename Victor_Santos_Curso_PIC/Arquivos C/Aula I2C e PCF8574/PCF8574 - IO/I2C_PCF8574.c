

void main() 
{//Inicio da main
  I2C1_Init(100000);
  TRISD = 0;
  PORTD = 0;
  TRISB0_bit = 1;

//Write  
I2C1_Start();
I2C1_Wr(0b01000010);
I2C1_Wr(0b01000001); //P7 .. P0
I2C1_Stop();


//Read
I2C1_Start();
I2C1_Wr(0b01000001);
PORTD = I2C1_Rd(0);
I2C1_Stop();
 

 for(;;)
 {//Inicio do Loop
 
 if(RB0_bit == 0)
 {
 //Read
  I2C1_Start();
  I2C1_Wr(0b01000001);
  PORTD = I2C1_Rd(0);
  I2C1_Stop();
  delay_ms(5);
  }
 
 }//Final do Loop
}//Final da main