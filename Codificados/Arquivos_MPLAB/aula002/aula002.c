/*
Programa simples para demostrar o uso de bot�es para
incrementar/decrementar uma vari�vel, e jogar o resultado no PORT B
sendo o resultado visualizado atrav�s de LEDs
*/


#include <16f628a.h>
#fuses XT, NOLVP, NOWDT
#use delay(clock=4000000)

int dado = 0;

void main(){
	while(true){
		if(!input(pin_a0)){ // bot�o MAIS (incremento)
			delay_ms(300);
			dado++;
		} else if(!input(pin_a1)){ // bot�o MENOS (decremento)
			delay_ms(300);
			dado--;
		}
		output_b(dado); // enviando a informa��o ao PORT B	
	}
}