// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 19
// Estruturas de Repetição

#include <stdio.h>
#include <stdlib.h>

int contador;
int i, j, k;

int main(){
	for(contador=10; contador>=0; contador--){//contador decrescente 10 - 0
		printf("CONTADOR = %i s \n", contador);
		//causa um delay no sistema para simular 1s
		for(i=0; i<=800;i++){
			for(j=0; j<=800; j++){
				for(k=0; k<=800; k++){
					;
				}
			}
		}
	}
	printf("\n\n");
	printf("Buuuumm! \n\n");//mensagem divertida no final
	
	system("PAUSE");
	return(0);
}
