/*
	Canal CODIFICADOS
	Usando Bibliotecas criadas pelo usuário

	Observar que a ordem dos arquivos é importante
	O arquivo de configuração do sistema e do PIC deve ser o primeiro
	Depois o de definições e variáveis
	Só então o de protótipo de funções e funções
*/

#include "config.h" 	// configurações do sistema
#include "definicoes.h"	// definições do sistema
#include "variaveis.h"	// variáveis do sistema
#include "prototipos.h"	//	protótipos de funções do sistema
#include "funcao.c"		// funções do sistema

// arquivo principal extremamente enxuto
// reutillização de códigos e coparticipação no desenvolvimento

void main(){
	while(true){
		piscaLed();
	}
}