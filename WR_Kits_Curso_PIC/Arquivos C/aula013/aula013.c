// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:      WRKits aula013
  Autor:                Marcelo Moraes
  Local:                Sorocaba - SP
  Data:                 04/01/2023
  MCU:                  PIC16F628A
  Descri��o do Projeto:
                        Display de 7 segmentos
                        Contador de 0 a 9

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //

// --- programa principal --- //
void main() {
  unsigned char catodo, cont = 0x00;
  unsigned char segmento[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6F};

  cmcon = 0x07; // desabilita comparadores
  trisB = 0x00; // todo o port B configurado como sa�da digital
  portB = 0x00; // port B inicia em n�vel baixo

  while(1){
    catodo = segmento[cont];  // n�mero a ser enviado para o port B
    portB = catodo;           // envia o pattern para o port B
    cont++;                   // incrementa o contador
    if(cont == 10) cont = 0;  // reinicia a contagem
    delay_ms(1000);           // delay para atualiza��o
  }
}
// --- defini��o das fun��es auxiliares --- //