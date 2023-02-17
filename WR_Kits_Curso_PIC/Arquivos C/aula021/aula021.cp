#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula021.c"
#line 29 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula021.c"
char uart_rd;
char txt[7];
long int valorAd = 0;



void main() {
 CMCON = 0x07;
 ADCON0 = 0x01;
 ADCON1 = 0x0E;

 TRISB = 0x01;
 PORTB = 0x00;
 TRISD = 0x00;
 PORTD = 0x00;

 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("Start");
 UART1_Write(10);
 UART1_Write(13);

 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();

 switch(uart_rd) {
 case 'y':  RD2_bit  = 0X01; break;
 case 't':  RD2_bit  = 0x00; break;
 case 'r':  RD0_bit  = 0X01; break;
 case 'e':  RD0_bit  = 0x00; break;
 case 'g':  RD1_bit  = 0x01; break;
 case 'f':  RD1_bit  = 0x00; break;
 }
 }

 if(! RB0_bit ) {
 valorAD = ADC_Read(0);
 valorAD = valorAD*500/1023;
#line 81 "C:/Users/ABMS-Telecom/Documents/PROTEUS/WR_Kits_Curso_PIC/Arquivos C/aula021.c"
 IntToStr(valorAD, txt);
 UART1_Write_Text(txt);
 UART1_Write_Text(" Celsius");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(100);
 }
 }
}
