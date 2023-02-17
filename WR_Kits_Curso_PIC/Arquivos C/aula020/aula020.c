// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F877A
  Descrição do Projeto:

*/

// --- observações e comentários gerais --- //
/*

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define YELLOW RB0_bit
#define RED RB1_bit
#define GREEN RB2_bit
#define S1 RB7_bit

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
char uart_rd;

// --- programa principal --- //

void main() {
  CMCON = 0x07;                   // desabilita comparadores
  ADCON0 = 0x00;                  // desabilita os conversores AD
  ADCON1 = 0x06;                  // tornar todo o ADC digital 0b000000110
  
  TRISB = 0x80;                   // RB7 como entrada
  PORTB = 0x00;                   // port B iniciando en nível low
  
  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  UART1_Write_Text("Start");  
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
    if(S1) {
    delay_ms(300);
      UART1_Write_Text("Botão Alerta Pressionado");
      UART1_Write(10);                // Line Feed (ASCII)
      UART1_Write(13);                // Carriage Return (ASCII)
    }
  }
}

// --- definição das funções auxiliares --- //