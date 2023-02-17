/*
  CONVERSOR A/D - EXEMPLO1
  Leitura do canal analógico AN0(RA0)
  Resultado mostrado no PORT D (ADRESH)
  Saída em 8 LEDs (L(MSB)7 - L0(LSB))
*/

void main() {
  TRISD = 0b00000000;     // configuração do PORT D como saída
  PORTD = 0b00000000;     // LEDs inicialmente apagados, PORT D em LOW
  TRISA.RA0 = 1;          // AN0(RA0) configurado como entrada

  ADCON0 = 0b10000101;    // [ADCS1 ADCS0 CHS2 CHS1 CHS0 CO/DONE --- ADON]
                          // Fosc/32 - canal 0 (AN0) - conversor em espera - módulo A/D ligado
  ADCON1 = 0b00001110;    // [ADFM ADCS2 --- --- PCFG3 PCFG2 PCFG1 PCFG0]
                          // justificado à esquerda - clock conversão Fosc/32 - somente AN0 ligado

  while(1){
    ADCON0.GO = 1;          // conversão A/D em progresso
    while(ADCON0.GO);       // espera enquanto a conversão estiver em progresso
    PORTD = ADRESH;         // carrega resultado no PORT D
    delay_ms(200);
  }
}