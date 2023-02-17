#include <main.h>

char letra;

void main()
{

   while(TRUE)
   {
      /*
      // transmissão serial   
      printf("Hello World!\r\n");
      delay_ms(1000);
      */
      
      
      if(kbhit()){
         letra = getc();
         
         if(letra == 'L')
         {
            output_high(pin_b0);
         }
         if(letra == 'D')
         {
            output_low(pin_b0);
         }
         
         
      }
      
   }

}
