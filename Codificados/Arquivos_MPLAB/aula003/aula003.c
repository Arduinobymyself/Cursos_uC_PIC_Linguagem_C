#include <16f628a.h>
#fuses XT, NOLVP, NOWDT
#use delay(clock=4000000)

int dado = 0;

void main(){
	while(true){
		if(!input(pin_a0)){
			delay_ms(300);
			dado++;
			if(dado > 9){
				dado = 0;
			}
		}
		output_b(dado);
	}
}