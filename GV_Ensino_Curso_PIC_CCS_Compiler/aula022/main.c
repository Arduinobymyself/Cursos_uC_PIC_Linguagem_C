#include <main.h>

/********************** ENUNCIADO ********************** 
Faça um programa que utilize dois botões.
Um botão terá a função de ligar um LED.
O outro botão, quando pressionado, irá desligar o LED.

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
