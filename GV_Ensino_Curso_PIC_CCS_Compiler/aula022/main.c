#include <main.h>

/********************** ENUNCIADO ********************** 
Fa�a um programa que utilize dois bot�es.
Um bot�o ter� a fun��o de ligar um LED.
O outro bot�o, quando pressionado, ir� desligar o LED.

********************************************************/

void main()
{

   while(TRUE)
   {
      if(input(pin_a0)){
         output_high(pin_b0);
      }
      else if(input(pin_a1)){
         output_low(pin_b0);
      }
   }

}
