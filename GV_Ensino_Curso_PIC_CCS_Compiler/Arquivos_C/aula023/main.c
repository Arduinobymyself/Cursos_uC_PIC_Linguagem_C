#include <main.h>

void main()
{
  
   while(true)
   {
   
      if(input(pin_a0)){
         output_toggle(pin_b0);
         delay_ms(300);
      }
      
   }

}
