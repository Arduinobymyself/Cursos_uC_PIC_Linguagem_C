#define LEDs PORTD


unsigned char texto[7] = "!led0#";
unsigned char c_texto = 0;
bit pot0, pot1;
unsigned int valorAD = 0;

void interrupt();

void main() {

   UART1_Init(9600);
   ADC_Init();
   delay_ms(10);

   UART1_Write_Text("PIC");
   while(!UART1_Tx_Idle());
   UART1_Write(13);
   while(!UART1_Tx_Idle());

   // interrupção
   GIE_bit = 1;
   PEIE_bit = 1;
   RCIE_bit = 1;

   TRISC6_bit = 0;
   TRISC7_bit = 1;
   
   TRISA = 0b00000011; // RA0 e RA1 como entrada

   TRISD = 0;
   PORTD = 0;
   
   ADCON1.PCFG3 = 0;
   ADCON1.PCFG2 = 0;
   ADCON1.PCFG1 = 0;
   ADCON1.PCFG0 = 0;

   while(1){
     if(pot0){
       valorAD = ADC_Get_Sample(0)*4.8878;
       UART1_Write('(');
       UART1_Write_text("pot0 = ");
       UART1_write(((valorAD/1000)+48));
       UART1_Write('.');
       UART1_write(((valorAD/100)%10+48));
       UART1_write(((valorAD/10)%10+48));
       UART1_Write('V');
       UART1_Write(')');
       UART1_Write(13);
       pot0 = 0;
     }
     if(pot1){
       valorAD = ADC_Get_Sample(1)*4.8876; // 1023 -> 5V ; pot0 = xV -> vlor da tensão
                                                        // 5/1023 = 0.00488758 em milivolts *1000 = 4.8876
       UART1_Write('(');
       UART1_Write_text("pot1 = ");
       UART1_write(((valorAD/1000)+48));
       UART1_Write('.');
       UART1_write(((valorAD/100)%10+48));
       UART1_write(((valorAD/10)%10+48));
       UART1_Write('V');
       UART1_Write(')');
       UART1_Write(13);
       pot1 = 0;
     }
   }


}


void interrupt(){

  if(RCIF_bit){

    texto[c_texto] = UART1_Read();

    if(texto[0] != '!'){
      c_texto = 0;
    } else {
      if(texto[c_texto] == '#'){

        c_texto = 0;
        if((texto[0] == '!') && (texto[1] == 'l') && (texto[2] == 'e') && (texto[3] == 'd')){
          switch(texto[4]){
            case '0': LEDs = 0; break; // apaga tudo!
            case '1': LEDs.b0 = ~LEDs.b0; break; // acende LED 1 mantendo a condição dos anteriores
            case '2': LEDs.b1 = ~LEDs.b1; break;
            case '3': LEDs.b2 = ~LEDs.b2; break;
            case '4': LEDs.b3 = ~LEDs.b3; break;
            case '5': LEDs.b4 = ~LEDs.b4; break;
            case '6': LEDs.b5 = ~LEDs.b5; break;
            case '7': LEDs.b6 = ~LEDs.b6; break;
            case '8': LEDs.b7 = ~LEDs.b7; break;
          }
        } else {
          if((texto[0] == '!') && (texto[1] == 'p') && (texto[2] == 'o') && (texto[3] == 't')){
            switch(texto[4]){
              case '0': pot0 = 1; break;
              case '1': pot1 = 1; break;
            }
          }
        }
      } else {
        c_texto++;
        if(c_texto > 5) c_texto = 0;
      }
    }
    RCIF_bit = 0;
  }

}