// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 17

#include <stdio.h>
#include <stdlib.h>

char letra = 'a';
int idade = 45;
float decimal_1 = 1.0;
double decimal_2 = 2.5;
const float real = 50.1;


int main(void){
	printf("\n LETRA = %c", letra);
	printf("\n IDADE = %i", idade);
	printf("\n NUMERO 1 = %.1f", decimal_1);
	printf("\n NUMERO_2 = %.2f", decimal_2);
	printf("\n REAL = %.3f", real);
	
	printf("\n\n");	
	
	system("PAUSE");
	return(0);
}
