#include <main.h>

/*******************************************************************
Faça um programa que utilize dois botões (A e B)
que acione uma saída (LED) conforme a lógica abaixo:

      A  B  S
      0  0  1
      0  1  0
      1  0  0
      1  1  1
      
      Expressõa lógica A*B + A'*B' 

*******************************************************************/
#define BotaoA input(pin_a0)
#define BotaoB input(pin_a1)
#define LED pin_b0

void main()
{

   while(TRUE)
   {
      if(BotaoA && BotaoB || !BotaoA && !BotaoB){
         output_high(pin_b0);
      }
      else
      {
         output_low(pin_b0);
      }
   }

}
