// SISTEMA PARADOXUS COM PIC 16F84A
// Crystal XT 4MHz
// Dois LEDs e dois Bot�es embarcados
// Barramento PORT B dispon�vel como I/O, assim como tamb�m o RA4

// --- inclus�o de bibliotecas --- //

// --- defini��es do sistema --- //
#define S1 RA0_bit
#define S2 RA1_bit
#define L1 RA2_bit
#define L2 RA3_bit

// --- prot�tipos de fun��es --- //

// --- vari�veis globais --- //
bit flagS1, flagS2;

// --- programa principal --- //
void main() {

  TRISA = 0b00000011; // RA0 e RA1 como entrada
  PORTA = 0b00000011; // RA0 e RA1 com resistores de pull-up

  TRISB = 0b00000000; // port B como sa�da
  PORTB = 0b00000000; // port B inicia em n�vel baixo
  
  while(1){
  
    if(!S1 && flagS1 == 0){  // se pressionou bot�o
      flagS1 = 1;            // seta flag
    }
    if(S1 && flagS1 == 1){   // se soltou bot�o
      flagS1 = 0;            // reseta flag
      L1 = ~L1;              // executa a��o
    }
    
    if(!S2 && flagS2 == 0){
      flagS2 = 1;
    }
    if(S2 && flagS2 == 1){
      flagS2 = 0;
      L2 = ~L2;
    }
  
  }
  
}