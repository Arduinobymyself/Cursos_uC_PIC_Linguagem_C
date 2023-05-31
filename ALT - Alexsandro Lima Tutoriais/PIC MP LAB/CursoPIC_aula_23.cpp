// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 23
// Estruturas Condicionais - IF ELSE 

#include <stdio.h>
#include <stdlib.h>

float nota1, nota2, nota3, nota4, media;


main(){
	printf("\n\n\n");
	printf(" DIGITE A PRIMEIRA NOTA: ");
	scanf("%f",&nota1);
	printf(" DIGITE A SEGUNDA NOTA: ");
	scanf("%f",&nota2);
	printf(" DIGITE A TERCEIRA NOTA: ");
	scanf("%f",&nota3);
	printf(" DIGITE A QUARTA NOTA: ");
	scanf("%f",&nota4);
	
	media=(nota1+nota2+nota3+nota4)/4;
	
	printf("MEDIA DAS NPOTAS = %f \n\n\n",media);
	
	if(media>=7){
		printf(" ALUNO APROVADO COM MEDIA: %.2f",media);
	}
	else{
		printf(" ALUNO REPROVADO COM MEDIA: %.2f",media);
	}
	printf("\n\n\n");
	
	system("PAUSE");
	return(0);
}
