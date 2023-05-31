// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 18
// Operadores aritméticos
// Expressões Lógicas e Relacionais

// COMENTÁRIO DE UMA LINHA

/*
COMENTÁRIO
COM
MAIS
DE
UMA
LINHA
*/


#include <stdio.h>
#include <stdlib.h>

int a = 8;
int b = 10;
int c = 2;
int d = 3;

int adicao, subtracao, multiplicacao, divisao, modulo;
int incremento, decremento, cont;

int main(){
	adicao = a+b;
	subtracao=b-a;
	multiplicacao=c*d;
	divisao=b/c;
	modulo=b%d;
	incremento=++b;
	decremento=--a;
	
	printf("A= %i, B= %i, C= %i, D= %i \n\n", a, b, c, d);
	printf("ADICAO A+B= %i \n",adicao);
	printf("SUBTRACAO B-A= %i \n",subtracao);
	printf("MULTIPLICACAO C*D= %d \n",multiplicacao);
	printf("DIVISAO B/C= %d \n",divisao);
	printf("MODULO B|D= %d \n",modulo);
	printf("INCREMENTO B++= %i \n",incremento);
	printf("DECREMENTO A--= %i \n\n\n",decremento);
	
	system("PAUSE");
	return(0);
}
