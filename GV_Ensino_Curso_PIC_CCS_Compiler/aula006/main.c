#include <main.h>

void main()
{

   while(TRUE)
   {
      output_high(pin_b0);
      delay_ms(250);
      output_low(pin_b1);
      delay_ms(250);
   }

}
