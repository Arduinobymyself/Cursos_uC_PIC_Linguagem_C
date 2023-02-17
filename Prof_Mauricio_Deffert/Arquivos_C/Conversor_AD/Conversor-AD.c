/*************************************************
CONVERSOR ANALÓGICO DIGITAL
AN0(RA0) MOSTRADO NO PORTD (ADRESH)
POR 8 LEDS (L7 - L6 - L5 - L4 - L3 - L2 - L1 - L0)

*************************************************/


void main() {
  TRISD = 0b00000000;     // PORT D como ssída
  PORTD = 0B00000000;     // LEDs Apagados
  TRISA.RA0 = 1;          // AN0(RA0) como entrada

  ADCON0 = 0b01000101;    // FOSC / 8 - canal 0 (AN0) - conversor em espera - Módulo A/D ligado
  ADCON1 = 0b00001110;    // Justificado à esquerda - clock conversão FOSC / 8 -  só AN0 analógico

  while(1){
    ADCON0.GO = 1;    // conversção A/D em progresso

    while(ADCON0.GO); // Espera enquanto a conversão estiver em progresso

    PORTD = ADRESH;   // define o valor convertido no PORTD
    delay_ms(20);
  }
}