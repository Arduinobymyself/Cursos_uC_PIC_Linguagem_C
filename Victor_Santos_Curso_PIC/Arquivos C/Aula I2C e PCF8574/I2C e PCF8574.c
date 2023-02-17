/*******************************************************************************
Firmware:
Autor:
Data:
Microcontrolador: 16F877A
Frequ�ncia: 8MHz
Compilador: MikroC PRO For PIC
Descri��o:
*******************************************************************************/
//Inclu��es de arquivos header (Cabe�alho)
/******************************************************************************/


//Defini��es (Apelidos)
/******************************************************************************/


//Vari�veis Globais
/******************************************************************************/
char valor = 0;

//Fun��es Secund�rias
/******************************************************************************/
void writePCF8574(char wdispositivo, char wvalor);


//Fun��o Principal
void main() {     // Fun��o Obrigat�ria da linguagem C
//Vari�veis Locais

//Inicializa��o das fun��es
  I2C1_Init(100000);
  
//Configura��o dos TRIS

  TRISD = 0;
  PORTD = 0x01;

//Condi��es iniciais das sa�das

     for(;;) //Loop infinito -- inicio do c�digo -- Obrigat�ria
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