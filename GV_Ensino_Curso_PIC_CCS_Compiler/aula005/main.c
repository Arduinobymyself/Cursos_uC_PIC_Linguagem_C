#include <main.h>

void main()
{
   // hello world! - pisca LED
   while(TRUE){
      output_high(pin_b0);
      delay_ms(250);
      output_low(pin_b0);
      delay_ms(250);
   }
}
