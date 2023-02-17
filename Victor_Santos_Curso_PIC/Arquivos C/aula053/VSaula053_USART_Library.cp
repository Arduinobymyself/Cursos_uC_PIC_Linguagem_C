#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula053_USART_Library.c"




unsigned char texto;

void main() {

 UART1_Init(9600);
 UART1_Write_Text("Marcelo Moraes");

 while(1){
 if(UART1_Data_Ready()){
 texto = UART1_read();
 UART1_Write(13);
 UART1_Write(texto);
 UART1_Write(13);
 while(!UART1_Tx_Idle());
 }

 }






}
