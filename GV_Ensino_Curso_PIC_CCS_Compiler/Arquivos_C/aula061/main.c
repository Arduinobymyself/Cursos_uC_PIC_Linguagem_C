#include <main.h>

// PWM - acionamento de um motor DC
// um bot�o acelera e um bot�o desacelera

signed long dutyPWM = 0;

void main()
{
   setup_timer_2(T2_DIV_BY_1,99,1);      //100 us overflow, 100 us interrupt
   
   // 99 + 1 = 100 * 4 = 400
   // 100% de duty = 400
   
   setup_ccp1(CCP_PWM);
   set_pwm1_duty((int16)0);

   while(TRUE)
   {
      if(input(pin_a0) == 1)
      { // aumenta o duty do PWM
         dutyPWM += 40;
         if(dutyPWM > 400)
         {
            dutyPWM = 400;
         }
         set_pwm1_duty((int16)dutyPWM);
         delay_ms(200);
      }
      if(input(pin_a1) == 1)
      { // diminui o duty do PWM
         dutyPWM -= 40;
         if(dutyPWM < 0)
         {
            dutyPWM = 0;
         }
         set_pwm1_duty((int16)dutyPWM);
         delay_ms(200);
      }
   }

}
