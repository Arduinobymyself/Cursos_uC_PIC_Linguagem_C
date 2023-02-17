// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F877A
  Descri��o do Projeto:
            TERMOMETRO VIA SERIAL - UART

*/

// --- observa��es e coment�rios gerais --- //
/*

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
#define YELLOW RD2_bit
#define RED RD0_bit
#define GREEN RD1_bit
#define S1 RB0_bit

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //
char uart_rd;
char txt[7];
long int valorAd = 0;

// --- programa principal --- //

void main() {
  CMCON = 0x07;                   // desabilita comparadores
  ADCON0 = 0x01;                  // configura os conversores AD 0b00000001 ADON = 1
  ADCON1 = 0x0E;                  // configura somente o AN0 como entrada anal�gica 0b000001110

  TRISB = 0x01;                   // RB0 como entrada
  PORTB = 0x00;                   // port B iniciando en n�vel low
  TRISD = 0x00;                   // port D como sa�da
  PORTD = 0x00;                   // port D inciando em n�vel low

  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  UART1_Write_Text("Start");      // escreve algo para testar a serial
  UART1_Write(10);                // Line Feed (ASCII)
  UART1_Write(13);                // Carriage Return (ASCII)
  
  while (1) {                     // Endless loop
    if (UART1_Data_Ready()) {     // If data is received,
      uart_rd = UART1_Read();     // read the received data,
      //UART1_Write(uart_rd);       // and send data via UART
      switch(uart_rd) {
        case 'y': YELLOW = 0X01; break;
        case 't': YELLOW = 0x00; break;
        case 'r': RED = 0X01; break;
        case 'e': RED = 0x00; break;
        case 'g': GREEN = 0x01; break;
        case 'f': GREEN = 0x00; break;
      }
    }
    
    if(!S1) {
      valorAD = ADC_Read(0);          // le a entrada anal�gica 0 e atribui valor � vari�vel
      valorAD = valorAD*500/1023;     // converte para temperatura
      
      /*
        1 �Celsius  ==  0,01V         padr�o do sensor LM35
        X �Celsius  ==  5,0V          m�ximo que pode ser atingido
        
        por regra de tr�s
        x = 5 / 0,01 = 500
        
        a resolu��o do ADC = 10bits 2^10 = 1024 (0 - 1023)
        
        assim, valorAD = valorAD * 500 / 1023
      */
      
      IntToStr(valorAD, txt);         // converte um int para um string
      UART1_Write_Text(txt);          // imprime o valor do ADC
      UART1_Write_Text(" Celsius");
      UART1_Write(10);                // Line Feed (ASCII)
      UART1_Write(13);                // Carriage Return (ASCII)
      delay_ms(100);
    }
  }
}

// --- defini��o das fun��es auxiliares --- //