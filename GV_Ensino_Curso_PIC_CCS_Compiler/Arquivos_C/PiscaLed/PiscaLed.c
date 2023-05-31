#include <PiscaLed.h>
int1 pisca = 0; // int1 é uma variável booleana de 1 bit

void pisca_led(void)
{
   if(pisca == true){
         output_low(LED_1);
         output_high(LED_2);
         pisca = false;
   } else {
      output_high(LED_1);
      output_low(LED_2);
      pisca = true;
   }

}

void main(){
   
   setup_adc(ADC_OFF);
   setup_comparator(NC_NC);
   output_low(LED_1);
   output_low(LED_2);
   while(true){
      pisca_led();
      delay_ms(1000);
   }
}
