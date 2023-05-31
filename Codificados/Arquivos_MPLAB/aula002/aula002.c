/*
Programa simples para demostrar o uso de botões para
incrementar/decrementar uma variável, e jogar o resultado no PORT B
sendo o resultado visualizado através de LEDs
*/


#include <16f628a.h>
#fuses XT, NOLVP, NOWDT
#use delay(clock=4000000)

int dado = 0;

void main(){
	while(true){
		if(!input(pin_a0)){ // botão MAIS (incremento)
			delay_ms(300);
			dado++;
		} else if(!input(pin_a1)){ // botão MENOS (decremento)
			delay_ms(300);
			dado--;
		}
		output_b(dado); // enviando a informação ao PORT B	
	}
}