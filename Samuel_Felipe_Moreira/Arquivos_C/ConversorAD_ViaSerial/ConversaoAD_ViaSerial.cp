#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/ConversaoAD_ViaSerial.c"
#line 6 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Samuel_Felipe_Moreira/Arquivos_C/ConversaoAD_ViaSerial.c"
unsigned short temp_res;

void main() {
 UART1_Init(9600);
 ADCON1 = 0;
 TRISA = 0xFF;
 do {
 temp_res = ADC_Read(0) >> 2;
 UART1_Write(temp_res);
 } while (1);
}
