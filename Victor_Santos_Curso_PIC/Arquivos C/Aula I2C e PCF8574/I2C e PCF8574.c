/*******************************************************************************
Firmware:
Autor:
Data:
Microcontrolador: 16F877A
Frequência: 8MHz
Compilador: MikroC PRO For PIC
Descrição:
*******************************************************************************/
//Incluções de arquivos header (Cabeçalho)
/******************************************************************************/


//Definições (Apelidos)
/******************************************************************************/


//Variáveis Globais
/******************************************************************************/
char valor = 0;

//Funções Secundárias
/******************************************************************************/
void writePCF8574(char wdispositivo, char wvalor);


//Função Principal
void main() {     // Função Obrigatória da linguagem C
//Variáveis Locais

//Inicialização das funções
  I2C1_Init(100000);
  
//Configuração dos TRIS

  TRISD = 0;
  PORTD = 0x01;

//Condições iniciais das saídas

     for(;;) //Loop infinito -- inicio do código -- Obrigatória
     { 
      
      writePCF8574(0,PORTD);
      Delay_ms(2000);

     }//final do Loop
}//Final da main

void writePCF8574(char wdispositivo, char wvalor)
{
  
  I2C1_Start();
  I2C1_Wr((0b01000000) | (wdispositivo << 1));
  I2C1_Wr( wvalor );
  I2C1_Stop();
  Delay_ms(5);
  
}