#include <16F88.h>
#device ADC=16

#FUSES NOWDT                 	//No Watch Dog Timer
#FUSES NOMCLR                	//Master Clear pin used for I/O
#FUSES NOBROWNOUT            	//No brownout reset
#FUSES NOLVP                 	//No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O
#FUSES NOFCMEN               	//Fail-safe clock monitor disabled
#FUSES NOIESO                	//Internal External Switch Over mode disabled

#use delay(crystal=4MHz)

