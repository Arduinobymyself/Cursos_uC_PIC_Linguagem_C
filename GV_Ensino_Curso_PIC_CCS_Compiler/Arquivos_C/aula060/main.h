#include <12F675.h>
#device ADC=10

#FUSES NOWDT                 	//No Watch Dog Timer
#FUSES NOMCLR                	//Master Clear pin used for I/O
#FUSES NOBROWNOUT            	//No brownout reset

#use delay(internal=4MHz)

