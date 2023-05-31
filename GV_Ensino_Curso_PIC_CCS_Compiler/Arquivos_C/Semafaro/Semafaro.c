#include <Semafaro.h>

// programa: automatiza um semáfaro simples com 3 LEDs
// autor: Eng. Marcelo Moraes - arduinobymyself.blogspot.com.br
// data: 30/05/2023
// mcu: pic16f88 clock interno 4Mhz
// simulador: SimuIDE
// compilador CCS C Compiler
// pin b0 LED vermelho (5s)
// pin b1 LED amarelo (3s)
// pin b2 LED verde (5s)

void main()
{

   while(TRUE)
   {
   
      //TODO: User Code
      output_high(pin_b0);
      output_low(pin_b1);
      output_low(pin_b2);
      delay_ms(5000);
      
      output_low(pin_b0);
      output_high(pin_b2);
      delay_ms(5000);
      
      output_low(pin_b2);
      output_high(pin_b1);
      delay_ms(3000);
      
   }

}
