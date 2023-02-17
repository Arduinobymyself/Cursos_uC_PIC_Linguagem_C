#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula020.c"
#line 28 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula020.c"
char uart_rd;



void main() {
 CMCON = 0x07;
 ADCON0 = 0x00;
 ADCON1 = 0x06;

 TRISB = 0x80;
 PORTB = 0x00;

 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("Start");
 UART1_Write(10);
 UART1_Write(13);
 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();

 switch(uart_rd) {
 case 'y':  RB0_bit  = 0X01; break;
 case 't':  RB0_bit  = 0x00; break;
 case 'r':  RB1_bit  = 0X01; break;
 case 'e':  RB1_bit  = 0x00; break;
 case 'g':  RB2_bit  = 0x01; break;
 case 'f':  RB2_bit  = 0x00; break;
 }
 }
 if( RB7_bit ) {
 delay_ms(300);
 UART1_Write_Text("Botão Alerta Pressionado");
 UART1_Write(10);
 UART1_Write(13);
 }
 }
}
