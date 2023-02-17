#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/15_MICRO_I/USART_1.c"
#line 21 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/15_MICRO_I/USART_1.c"
char uart_rd;



void main() {
 CMCON = 0x07;

 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("Start, teste de Echo");
 UART1_Write(10);
 UART1_Write(13);
 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 }
}
