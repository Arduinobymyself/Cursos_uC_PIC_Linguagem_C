#include <main.h>


void main()
{

   while(TRUE){
   
      if(input(pin_a0)){
         output_high(pin_b0);
      } 
      else {
         output_low(pin_b0);
      }
      
   }

}
