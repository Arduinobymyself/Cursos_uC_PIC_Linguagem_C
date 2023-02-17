#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/15_MICRO_I/USART_2.c"
#line 21 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Prof_Mauricio_Deffert/Arquivos_C/15_MICRO_I/USART_2.c"
char uart_rd;



void main() {
 CMCON = 0x07;

 TRISB = 0xFF;
 PORTB = 0xFF;
 TRISD = 0;
 PORTD = 0;

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

 switch(uart_rd) {
 case 'A': RD0_bit = 1; break;
 case 'B': RD1_bit = 1; break;
 case 'C': RD2_bit = 1; break;
 case 'D': RD3_bit = 1; break;
 case 'E': RD4_bit = 1; break;
 case 'F': RD5_bit = 1; break;
 case 'G': RD6_bit = 1; break;
 case 'H': RD7_bit = 1; break;
 case 'I': PORTD = 0; break;
 }

 if(!RB0_bit) {
 delay_ms(300);
 UART1_Write(10);
 UART1_Write(13);
 UART1_Write_Text("Botao Alerta Pressionado");
 UART1_Write(10);
 UART1_Write(13);
 }

 }
}
