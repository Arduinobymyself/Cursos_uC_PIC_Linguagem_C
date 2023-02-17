#include <main.h>

void main()
{
   // port_b_pullups(true); // para habilitar o pull-up interno do port B
   while(true)
   {
      if(input(pin_b0) == 0){
         output_high(pin_b1);
      }
      else
      {
         output_low(pin_b1);
      }
   }

}
