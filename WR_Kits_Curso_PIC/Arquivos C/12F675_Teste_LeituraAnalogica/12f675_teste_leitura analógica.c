#define L1 GPIO.F1
#define L2 GPIO.F2
#define L3 GPIO.F4




int leitura = 0;

void main() {
  ANSEL  = 0b00000001; // entrada analógica AN0 selecionada
  ADCON0 = 0b00000001; // entrada analógica AN0 habilitada
  CMCON  = 0b00000111; // desabilita comparadores
  TRISIO = 0b00000001; // GPIO.F0 como entrada
  GPIO   = 0;          // inicia em nível baixo
  
  while(1){
  
    leitura = adc_read(0); // faz a leitura do AN0
    
    if(leitura > 256){
      L1 = 1;
      L2 = 0;
      L3 = 0;
    }
    
    if(leitura > 512){
      L1 = 0;
      L2 = 1;
      L3 = 0;
    }
    
    if(leitura > 768){
      L1 = 0;
      L2 = 0;
      L3 = 1;
    }

  }
  
}