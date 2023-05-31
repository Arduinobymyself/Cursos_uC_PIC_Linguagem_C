#include <12F675.h>
#device ADC=16

#FUSES NOWDT                    //No Watch Dog Timer
#FUSES NOBROWNOUT               //No brownout reset
#FUSES INTRC
#FUSES NOCPD
#FUSES NOMCLR
#FUSES PUT
#FUSES NOPROTECT

#use delay(internal=4MHz)
#define LED_1 PIN_A4
#define LED_2 PIN_A5
