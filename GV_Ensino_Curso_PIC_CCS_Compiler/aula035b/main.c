#include <main.h>

char letra;

void main()
{

   while(TRUE)
   {
      if(kbhit())
      {
         letra = getc();
         if(letra == 'a')
         {
            output_toggle(pin_a0);
         }
         if(letra == 'b')
         {
            output_toggle(pin_a1);
         }
      }
   }

}
