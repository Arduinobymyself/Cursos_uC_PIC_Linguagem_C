// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 22
// Estruturas Condicionais - IF 

#include <stdio.h>
#include <stdlib.h>

int numero;


main(){
	printf("Digite um numero entre 5 e 10: ");
	scanf("%i \n\n", &numero);
	//if(numero==5 || numero==6 || numero==7 || numero==8 || numero==9 || numero==10){
	if(numero>=5 && numero<=10){
		printf("O numero %i esta dentro da faixa permitida \n\n",numero);
	}
	if(numero<5){
		printf("O numero %i esta abaixo da faixa permitida \n\n",numero);
	}
	if(numero>10){
		printf(" O numero %i está acima da faixa permitida \n\n",numero);
	}
	
	system("PAUSE");
	return(0);
}
