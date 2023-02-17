
#define S1 RA1_bit
#define S2 RA0_bit
#define L1 RA3_bit
#define L2 RA2_bit



// um tipo de jogo onde os LEDs acendem aleatoriamente e o jogador
// tem que apertar o botão correspondente.

int numbers;

void main() {
  CMCON = 7;
  TRISA = 3; // S1 e S2 entradas
  PORTA = 0;

  while(1){
    numbers = rand(); // numbers receberá um número aleatório entre 0  e 32767
    L1 = numbers;
    L2 = ~L1; // se L1 aceso, L2 estará apagado

    while(L1){ // enquanto L1 aceso
      if(S1 == 0) L1 = 0; // se pressionou S1, apaga L1
      delay_ms(70); // debouncing
    }
    while(L2){ // enquanto L2 aceso
      if(S2 == 0) L2 = 0; // se pressionado S2, apaga L2
      delay_ms(70); // debouncing
    }
    delay_ms(500);
  }

}