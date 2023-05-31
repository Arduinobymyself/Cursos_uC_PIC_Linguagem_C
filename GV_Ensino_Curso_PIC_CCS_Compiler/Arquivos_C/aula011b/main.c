#include <main.h>

void main()
{

   while(TRUE)
   {
      output_b(0b00000000);
      delay_ms(300);
      
      output_b(0b00000001);
      delay_ms(300);
      
      output_b(0b00000010);
      delay_ms(300);
      
      output_b(0b00000100);
      delay_ms(300);
      
      output_b(0b00001000);
      delay_ms(300);
      
      output_b(0b00010000);
      delay_ms(300);
      
      output_b(0b00100000);
      delay_ms(300);
      
      output_b(0b01000000);
      delay_ms(300);
      
      output_b(0b10000000);
      delay_ms(300);
      

   }

}
