#include <16F628A.h>

#FUSES NOWDT                 	//No Watch Dog Timer
#FUSES NOMCLR                	//Master Clear pin used for I/O
#FUSES NOBROWNOUT            	//No brownout reset
#FUSES NOLVP                 	//No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O

#use delay(internal=4MHz)
#use rs232(baud=9600,parity=N,xmit=PIN_A0,rcv=PIN_A1,bits=8,stream=PORT1)

