// --- Cabe�alho do programa --- //
/*
Nome do Projeto:      WRKits aula014
Autor:                Marcelo Moraes
Local:                Sorocaba - SP
Data:                 04/01/2023
MCU:                  PIC16F877A
Descri��o do Projeto: Display 7 segmentos
		  	 		  Contador de 00 a 99

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//

// --- prot�tipo das fun��oes --- //
void nibbleDown(char number);
void nibbleUp(char number);

// --- vari�veis globais --- //
char counter1 = 0, counter2 = 0;

// --- programa principal --- //
void main() {

unsigned char segmento[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f};

  cmcon = 0x07; // desabilita comparadores
  trisA = 0x00;
  trisB = 0x00; // todo o port B configurado como sa�da digital
  portA = 0x00;
  portB = 0x00; // port B inicia em n�vel baixo

  while(1)
  {
    counter1++;
    nibbleDown(counter1);
    nibbleUp(counter2);

    if(counter1 == 10)
    {
      counter2++;
      counter1 = 0;
      nibbleDown(counter1);
      nibbleUp(counter2);
      if(counter2 == 10)
      {
        counter2 = 0;
        nibbleUp(counter2);
      }
    }
    delay_ms(300);
  }
}

// --- defini��o das fun��es auxiliares --- //
void nibbleDown(char number)
{
  switch(number)
  {
    case 0:
      rb0_bit = 0x00;
      rb1_bit = 0x00;
      rb2_bit = 0x00;
      rb3_bit = 0x00;
      break;
    case 1:
      rb0_bit = 0x01;
      rb1_bit = 0x00;
      rb2_bit = 0x00;
      rb3_bit = 0x00;
      break;
    case 2:
      rb0_bit = 0x00;
      rb1_bit = 0x01;
      rb2_bit = 0x00;
      rb3_bit = 0x00;
      break;
    case 3:
      rb0_bit = 0x01;
      rb1_bit = 0x01;
      rb2_bit = 0x00;
      rb3_bit = 0x00;
      break;
    case 4:
      rb0_bit = 0x00;
      rb1_bit = 0x00;
      rb2_bit = 0x01;
      rb3_bit = 0x00;
      break;
    case 5:
      rb0_bit = 0x01;
      rb1_bit = 0x00;
      rb2_bit = 0x01;
      rb3_bit = 0x00;
      break;
    case 6:
      rb0_bit = 0x00;
      rb1_bit = 0x01;
      rb2_bit = 0x01;
      rb3_bit = 0x00;
      break;
    case 7:
      rb0_bit = 0x01;
      rb1_bit = 0x01;
      rb2_bit = 0x01;
      rb3_bit = 0x00;
      break;
    case 8:
      rb0_bit = 0x00;
      rb1_bit = 0x00;
      rb2_bit = 0x00;
      rb3_bit = 0x01;
      break;
    case 9:
      rb0_bit = 0x01;
      rb1_bit = 0x00;
      rb2_bit = 0x00;
      rb3_bit = 0x01;
      break;
  }
}

void nibbleUp(char number)
{
  switch(number)
  {
    case 0:
      rb4_bit = 0x00;
      rb5_bit = 0x00;
      rb6_bit = 0x00;
      rb7_bit = 0x00;
      break;
    case 1:
      rb4_bit = 0x01;
      rb5_bit = 0x00;
      rb6_bit = 0x00;
      rb7_bit = 0x00;
      break;
    case 2:
      rb4_bit = 0x00;
      rb5_bit = 0x01;
      rb6_bit = 0x00;
      rb7_bit = 0x00;
      break;
    case 3:
      rb4_bit = 0x01;
      rb5_bit = 0x01;
      rb6_bit = 0x00;
      rb7_bit = 0x00;
      break;
    case 4:
      rb4_bit = 0x00;
      rb5_bit = 0x00;
      rb6_bit = 0x01;
      rb7_bit = 0x00;
      break;
    case 5:
      rb4_bit = 0x01;
      rb5_bit = 0x00;
      rb6_bit = 0x01;
      rb7_bit = 0x00;
      break;
    case 6:
      rb4_bit = 0x00;
      rb5_bit = 0x01;
      rb6_bit = 0x01;
      rb7_bit = 0x00;
      break;
    case 7:
      rb4_bit = 0x01;
      rb5_bit = 0x01;
      rb6_bit = 0x01;
      rb7_bit = 0x00;
      break;
    case 8:
      rb4_bit = 0x00;
      rb5_bit = 0x00;
      rb6_bit = 0x00;
      rb7_bit = 0x01;
      break;
    case 9:
      rb4_bit = 0x01;
      rb5_bit = 0x00;
      rb6_bit = 0x00;
      rb7_bit = 0x01;
      break;
  }
}
