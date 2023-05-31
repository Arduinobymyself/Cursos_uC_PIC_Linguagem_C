/*
	Canal CODIFICADOS
	Usando Bibliotecas criadas pelo usu�rio

	Observar que a ordem dos arquivos � importante
	O arquivo de configura��o do sistema e do PIC deve ser o primeiro
	Depois o de defini��es e vari�veis
	S� ent�o o de prot�tipo de fun��es e fun��es
*/

#include "config.h" 	// configura��es do sistema
#include "definicoes.h"	// defini��es do sistema
#include "variaveis.h"	// vari�veis do sistema
#include "prototipos.h"	//	prot�tipos de fun��es do sistema
#include "funcao.c"		// fun��es do sistema

// arquivo principal extremamente enxuto
// reutilliza��o de c�digos e coparticipa��o no desenvolvimento

void main(){
	while(true){
		piscaLed();
	}
}