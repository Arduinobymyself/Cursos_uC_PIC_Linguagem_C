#include <16f628a.h>
#fuses XT, NOLVP, NOWDT
#use delay(clock=4000000)

/*
	Canal CODIFICADOS - aula 004
	Trabalhando com funções
*/

// protótipo da função
void piscaLed();

int dado = 0;

void main(){
	while(true){
		if(!input(pin_a0)){
			delay_ms(300);
			piscaLed();	
		}
		if(!input(pin_a1)){
			delay_ms(300);
			piscaLed();	
		}
	}
}

// desenvolvimento da função
void piscaLed(){
	output_high(pin_b0);
	delay_ms(200);
	output_low(pin_b0);
}