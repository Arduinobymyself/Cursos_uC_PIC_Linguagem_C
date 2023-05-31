// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 21
// Estruturas de Repetição - Do WHILE

#include <stdio.h>
#include <stdlib.h>

int contador = 0;

main(){
	do{
		printf("Contador %i \n",contador);
		contador = ++contador;
	}while(contador <=5);
	printf("\n\n");
	
	system("PAUSE");
	return(0);
}
