
#include <16F628A.h>
#fuses xt, nowdt, put, mclr, nobrownout, nolvp, nocpd, noprotect
#use delay(clock = 4M)

#define LED1      pin_a3
#define LED2      pin_a2
#define S1        pin_a1
#define S2        pin_a0

#define output    pin_b7

unsigned int16 counter = 0;

#INT_TIMER0
void timer0_int(void){
   SET_TIMER0(6);
   counter++;
   if(counter == 500){
      counter = 0;
      output_toggle(output);
   }
}

void main()
{
   output_low(output);
   
   ENABLE_INTERRUPTS(GLOBAL);
   ENABLE_INTERRUPTS(INT_TIMER0);
   SETUP_TIMER_0(RTCC_INTERNAL | RTCC_8_BIT | RTCC_DIV_4);
   SET_TIMER0(6);
   
   while(TRUE)
   {
      
   }

}
