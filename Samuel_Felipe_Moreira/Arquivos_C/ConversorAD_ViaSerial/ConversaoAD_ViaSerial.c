/*centro de tecnologia Microgenios
Programa exemplo: acionamento dos conversores A/D ANAL0 e envio do valor da
conversão pela serial Rs232.
*/
//Inicio do programa
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