#include <16F628A.h>

#fuses XT, NOWDT, NOLVP
#use delay(clock=4000000)
#use fast_io(b)

#byte intcon = 0x0b		// end do registrador INTCON que contém a flag de estouro do tmr0
#bit T0IF = intcon.2	// flag de estouro do tmr0 (T0IF =  bit 2)

void main(){
	set_tris_b(0x00);
	output_b(0);
	
	int cont = 31;		// variável que armazena a quantidade de estouros do TMR0
						// R = 1/(Fosc/4)*(255-TMR0)*PRSC
						// R = resolução do TMR0
						// Fosc = Frequência do oscilador local (4Mhz)
						// TMR0 = valor inicial da contagem (TMR0 = 0)
						// PRSC = prescaler (1:256)
						// R = 1/(4M/4)*(255-0)*256 = 65ms
						// Tmax = R*n, sendo n = qtde de estouros
						// para obter 2s .... 2s = 65ms * n -> n = 2/65m = 31
						// ou seja, precisamos 31 estouros de 65ms para obter 2s.......

	setup_timer_0(RTCC_INTERNAL | RTCC_DIV_256); 	// configurando o timer para trabalhar como 
													// temporizador e prescaler em 256
	set_timer0(0);						// valor inicial para contagem do timer, neste caso zero TMR0 = 0
	while(true){
		if(T0IF){						// se T0IF = 1, ou seja, se houve um estouro de timer
			T0IF = 0;					// zera a flag do bit T0IF para poder sinalizar um novo estouro
			cont--;						// decrementa a variável cont, que tinha o valor inicial de 31
			if(cont == 0){				// verifica se o valor da variável cont chegou em zero
				output_toggle(pin_b0);	// caso sim, inverte o nível do pino RB0
				cont = 31;				// coloca 31 em cont para que ela possa retornar
			}
		}
	}
}