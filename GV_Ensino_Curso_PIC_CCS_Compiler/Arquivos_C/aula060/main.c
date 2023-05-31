#include <main.h>

long valor; // ou int16

void main()
{
   setup_adc_ports(sAN0);
   setup_adc(ADC_CLOCK_INTERNAL);

   while(TRUE)
   {
      set_adc_channel(0); // configura a entrada de leitura
      delay_ms(10);
      
      valor = read_adc(); // leitura da informação
      
      if(valor >= 0 && valor < 256)
      {
         output_high(pin_a1);
         output_low(pin_a2);
         output_low(pin_a4);
         output_low(pin_a5);
      }
      if(valor >= 256 && valor < 512)
      {
         output_low(pin_a1);
         output_high(pin_a2);
         output_low(pin_a4);
         output_low(pin_a5);
      }
      if(valor >= 512 && valor < 768)
      {
         output_low(pin_a1);
         output_low(pin_a2);
         output_high(pin_a4);
         output_low(pin_a5);
      }
      if(valor >= 768 && valor < 1024)
      {
         output_low(pin_a1);
         output_low(pin_a2);
         output_low(pin_a4);
         output_high(pin_a5);
      }
      
   }

}
