/*************************************************
CONVERSOR ANALÓGICO DIGITAL
AN1(RA1) MOSTRADO NO PORTD (ADRESH + ADRESL)
POR 8 LEDS (L7 - L6 - L5 - L4 - L3 - L2 - L1 - L0)

*************************************************/

unsigned int leituraAD;

void main() {

  TRISD = 0b00000000;     // PORT D como ssída
  PORTD = 0B00000000;     // LEDs Apagados
  TRISA.RA1 = 1;          // AN1(RA1) como entrada

  // usando adc-read() não preciso me preocupar com em configurar o ADCON0 e ADCON1
  
  while(1){
    leituraAD = adc_read(1); // leitura do canal AN1
    leituraAD = (leituraAD / 4); // conversão do resultado de 10 para 8 bits
                                 // 10^2 = 1024, 1024 / 4 = 256, 256 = 2^8
                                 // ou seja converteu de 10 para 8 bits
    PORTD = leituraAD; // carrega a informação no PORT D
  }
}