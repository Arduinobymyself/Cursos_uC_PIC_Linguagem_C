// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Fev 2023
  MCU:                      PIC16F877A
  Descrição do Projeto:
  
  USART - teste de escrita e echo

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
char uart_rd;

// --- programa principal --- //

void main() {
  CMCON = 0x07;                   // desabilita comparadores
  TRISD = 0;
  PORTD = 0;

  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  UART1_Write_Text("Start, teste de Echo");
  UART1_Write(10);                // Line Feed (ASCII)
  UART1_Write(13);                // Carriage Return (ASCII)
  while (1) {                     // Endless loop
    if (UART1_Data_Ready()) {     // If data is received,
      uart_rd = UART1_Read();     // read the received data,
      UART1_Write(uart_rd);       // and send data via UART
    }
  }
}

// --- definição das funções auxiliares --- //