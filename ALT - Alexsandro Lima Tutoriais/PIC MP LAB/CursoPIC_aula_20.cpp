// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 20
// Estruturas de Repetição - WHILE

#include <stdio.h>
#include <stdlib.h>

int contador = 0;

main(){
	while(contador <=5){//conta de 1 a 5
		printf("Contador %i \n", contador);//imprime mensagem
		contador = ++contador;//incrementa o contador
	}
	printf("\n\n");
	
	system("PAUSE");
	return(0);
}
