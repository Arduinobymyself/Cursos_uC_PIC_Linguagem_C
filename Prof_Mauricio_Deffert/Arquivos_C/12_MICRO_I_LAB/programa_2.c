/*
  CONVERSOR A/D - EXEMPLO 2
  Leitura do canal analógico AN1(RA1)
  Mostrada no PORT D
  Sinalizado por 8 LEDs (L7(MSB) - L0(LSB))
*/

unsigned char leituraAD;
int temp = 0;

void main() {
TRISD = 0b00000000;                  // configura PORT D  como saída
PORTD = 0b00000000;                  // LEDs apagados
TRISA.RA1 = 1;                       // AN1(RA1) configurado como entrada

while(1){
  leituraAD = ADC_Read(1);           // lê o canal analógico 0
  leituraAD /= 4;                    // salva na variável
                                     // divisão por 4 para transformar de 10 para 8 bits
                                     // diminui a resolução, mas não joga fora os bits mais significativos

  temp = leituraAD*0.4887;

  PORTD = leituraAD;                 // carrega resultado para o PORT D
  }
}