
#include "24C32A_I2C_lib.h"

char caractere;
char texto[20];
char tamanho;


void main() {
  I2C1_Init(100000);   // incicializa o I2C1
  UART1_Init(9600);
  
  
  write24C32A(0x00, 0x00, 'a');
  caractere = read24C32A(0x00, 0x00);
  UART1_Write(caractere);
  UART1_Write(13);
  
  write24C32A_text(0x01, 0x00, "Marcelo Moraes#");
  read24C32A_text(0x01, 0x00, texto, '#');
  tamanho = strlen(texto);
  texto[tamanho-1] = '\0';
  UART1_Write_Text(texto);
  
  while(1){
  
  }
  
}