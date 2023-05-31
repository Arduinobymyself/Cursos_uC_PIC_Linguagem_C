//----- ds1302 pinleri tanýmlanýyor --------------------------------------------
#ifndef     rtc_sclk
#define     rtc_sclk   pin_c1
#define     rtc_io     pin_c2
#define     rtc_rst    pin_c0
#endif
//------------------------------------------------------------------------------

#include <16F877A.h>

#FUSES NOWDT                    //No Watch Dog Timer
#FUSES XT                          //Clock <=4Mhz
#FUSES PUT                      //Power Up Timer
#FUSES NOPROTECT                //Code not protected from reading
#FUSES NOBROWNOUT               //No brownout reset
#FUSES NOLVP                    //No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O
#FUSES NOCPD                    //No EE protection

#use delay(clock=4000000)

#include <math.h>
#include <DS1302.c>
#include <lcd.c>

#define botao_incremento PIN_C6
#define botao_decremento PIN_C7

BYTE sec;
BYTE min;
BYTE hrs;
BYTE day;
BYTE month;
BYTE yr;
BYTE dow;
int8 modo;

char dia_da_semana[7][8]=
{
   "DOMINGO",
   "SEGUNDA",
   "TERCA",
   "QUARTA",
   "QUINTA",
   "SEXTA",
   "sábado",
};

#int_EXT
void  EXT_isr(void)
{
   modo++;
   if (modo > 7 )
   {
      modo = 0;
   }
}

void main()
{
   setup_adc_ports(NO_ANALOGS);
   setup_adc(ADC_OFF);
   setup_psp(PSP_DISABLED);
   setup_spi(SPI_SS_DISABLED);
   setup_timer_0(RTCC_INTERNAL|RTCC_DIV_1);
   setup_timer_1(T1_DISABLED);
   setup_timer_2(T2_DISABLED,0,1);
   setup_comparator(NC_NC_NC_NC);
   setup_vref(FALSE);
   enable_interrupts(INT_EXT);
   enable_interrupts(GLOBAL);
 rtc_init();
 delay_ms(20);
   //ds1307_init();
   lcd_init();
   modo = 0;
   tempo = 0;

   while(true)
   {
      switch (modo)
      {
         case 1:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               hrs++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               hrs--;
            }

            if (hrs > 23 )
            {
               hrs = 0;
            }

            /*if (hrs == 255 )
            {
               hrs = 23;
            }*/

            printf(lcd_putc,"\fAjustar Hora:\n%u",hrs);
            delay_ms (100);
            break;
         }

         case 2:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               min++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               min--;
            }

            if (min > 59 )
            {
               min = 0;
            }

            /*if (min == 255 )
            {
               min = 59;
            }*/

            printf(lcd_putc,"\fAjustar Minutos:\n%u",min);
            delay_ms (100);
            break;
         }

         case 3:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               sec++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               sec--;
            }

            if (sec > 59 )
            {
               sec = 0;
            }

            /*if (sec == 255 )
            {
               sec = 59;
            }*/

            printf(lcd_putc,"\fAjustar Segundos:\n%u",sec);
            delay_ms (100);
            break;
         }

         case 4:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               day++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               day--;
            }

            if (day > 31 )
            {
               day = 1;
            }

            if (day == 0 )
            {
               day = 31;
            }

            printf(lcd_putc,"\fDia do Mes:\n%u",day);
            delay_ms (100);
            break;
         }

         case 5:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               month++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               month--;
            }

            if (month > 12 )
            {
               month = 1;
            }

            if (month == 0 )
            {
               month = 12;
            }

            printf(lcd_putc,"\fAjustar Mes:\n%u",month);
            delay_ms (100);
            break;
         }

         case 6:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               yr++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               yr--;
            }

            if (yr > 99 )
            {
               yr = 1;
            }

            if (yr == 0 )
            {
               yr = 99;
            }

            printf(lcd_putc,"\fAjustar Ano:\n%u",yr);
            delay_ms (100);
            break;
         }

         case 7:
         {
            if (input(BOTAO_INCREMENTO))
            {
               delay_ms (75);
               dow++;
            }

            if (input(BOTAO_DECREMENTO))
            {
               delay_ms (75);
               dow--;
            }

            if (dow > 7 )
            {
               dow = 1;
            }

            if (dow == 0)
            {
               dow = 7;
            }

            printf(lcd_putc,"\fDia da Semana:\n%s",dia_da_semana[dow-1]);
            delay_ms (100);
            rtc_set_datetime(day,month,yr,dow,hrs,min);
            break;
         }

         default:
{

rtc_get_date(day,month,yr,dow);
rtc_get_time(hrs,min,sec);
printf(lcd_putc,"\f%s %02d:\%02d:\%02d\n%02d/\%02d/\%02d",dia_da_semana[dow-1],hrs,min,sec,day,month,yr);
delay_ms(1000);
}
}
}
}