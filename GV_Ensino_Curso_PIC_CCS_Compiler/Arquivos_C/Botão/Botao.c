#include <Botao.h>

void main()
{
   while(TRUE)
   {
      //TODO: User Code
      if(!input(pin_a0)){
         delay_ms(300);
         output_toggle(pin_b0);
      } 
   }
}
