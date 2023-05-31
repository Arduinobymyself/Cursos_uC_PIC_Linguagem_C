// Curso PIC MikroC Pro
// Alexsandro Lima Tutoriais
// YouTube
// Aula 24
// Estruturas Condicionais - SWITCH CASE 

#include <stdio.h>
#include <stdlib.h>

int selecao;

main(){
	
	while(1){
		printf("\n\n\n");
		printf(" WHAT YOU WANT TO DO ? \n\n");
		printf(" 1 - CALCULATOR \n");
		printf(" 2 - NOTE PAD \n");
		printf(" 3 - EXPLORER \n");
		printf(" 4 - PAINT BRUSH \n");
		printf(" 5 - COMMAND PROMPT \n\n");
		printf(" MAKE YOUR CHOICE: ");
		scanf("%d",&selecao);
	
		switch(selecao){
			case 1:
				system("calc.exe");
				break;
			case 2:
				system("notepad.exe");
				break;
			case 3:
				system("explorer.exe");
				break;
			case 4:
				system("mspaint.exe");
				break;
			case 5:
				system("cmd.exe");
				break;
			default:
				printf("\n\n\n");
				printf(" SELECT A VALID OPTION BETWEEN 1 - 5");
		}
    }
	printf("\n\n\n");
	
	system("PAUSE");
	return(0);
}
