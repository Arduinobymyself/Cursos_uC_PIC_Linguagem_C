#include <ComunicacaoSerial.h>


char letra;

void main()
{

   while(TRUE)
   {
      /*
      // transmissão na serial
      printf("Hello World\r\n");
      delay_ms(1000);
      */
      
      // recepção da serial
      if(kbhit()){
         letra = getc();
         if(letra == 'A'){
            output_high(pin_b0);
         }
         if(letra == 'B'){
            output_high(pin_b1);
         }
         if(letra == 'C'){
            output_high(pin_b2);
         }
      }
      
   }

}
