#include <main.h>

void main()
{

   while(TRUE)
   {
      output_b(0b00000000);
      delay_ms(500);
      output_b(0b00111111); // 0
      delay_ms(300);
      output_b(0b00000110); // 1
      delay_ms(300);
      output_b(0b01011011); // 2
      delay_ms(300);
      output_b(0b01001111); // 3
      delay_ms(300);
      output_b(0b01100110); // 4
      delay_ms(300);
      output_b(0b01101101); // 5
      delay_ms(300);
      output_b(0b01111101); // 6
      delay_ms(300);
      output_b(0b00000111); // 7
      delay_ms(300);
      output_b(0b01111111); // 8
      delay_ms(300);
      output_b(0b01101111); // 9
      delay_ms(500);
   }

}
