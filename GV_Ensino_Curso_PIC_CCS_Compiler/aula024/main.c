#include <main.h>

void main()
{

   while(TRUE)
   {
      
      //L�gica AND (E)
      if(input(pin_a0) && input(pin_a1)){
         output_high(pin_b0);
         delay_ms(3000);
         output_low(pin_b0);
      }
      
      
      /*
      // L�gica OR (OU)
      if(input(pin_a0) || input(pin_a1)){
         output_high(pin_b0);
         delay_ms(3000);
         output_low(pin_b0);
      }
      */
      
   }

}
