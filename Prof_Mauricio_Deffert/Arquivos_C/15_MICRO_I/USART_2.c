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
  
  TRISB = 0xFF;
  PORTB = 0xFF;
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
    
    switch(uart_rd) {
      case 'A': RD0_bit = 1; break;  // liga LED 0
      case 'B': RD1_bit = 1; break;  // liga LED 1
      case 'C': RD2_bit = 1; break;
      case 'D': RD3_bit = 1; break;
      case 'E': RD4_bit = 1; break;
      case 'F': RD5_bit = 1; break;
      case 'G': RD6_bit = 1; break;
      case 'H': RD7_bit = 1; break;
      case 'I': PORTD = 0; break;    // desliga tudo
    }
    
    if(!RB0_bit) {
      delay_ms(300);
      UART1_Write(10);                // Line Feed (ASCII)
      UART1_Write(13);                // Carriage Return (ASCII)
      UART1_Write_Text("Botao Alerta Pressionado");
      UART1_Write(10);                // Line Feed (ASCII)
      UART1_Write(13);                // Carriage Return (ASCII)
    }
     
  }
}

// --- definição das funções auxiliares --- //