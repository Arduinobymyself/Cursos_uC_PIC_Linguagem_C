#include <16f628a.h>
#fuses XT, NOLVP, NOWDT
#use delay(clock=4000000)

int dado = 0;
int dadoLSB = 0;
int dadoMSB = 0;

void main(){
	while(true){
		if(!input(pin_a0)){
			delay_ms(300);
			dadoLSB++;
			dado = dadoMSB + dadoLSB;
			if(dadoLSB > 9){
				dadoLSB = 0;
				dadoMSB++;
				dado = dadoMSB + dadoLSB;
			}
		}
		output_b(dado);
	}
}