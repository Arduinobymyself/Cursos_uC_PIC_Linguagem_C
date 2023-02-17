// SISTEMA PARADOXUS COM PIC 16F84A
// Crystal XT 4MHz
// Dois LEDs e dois Botões embarcados
// Barramento PORT B disponível como I/O, assim como também o RA4

// --- inclusão de bibliotecas --- //

// --- definições do sistema --- //
#define S1 RA0_bit
#define S2 RA1_bit
#define L1 RA2_bit
#define L2 RA3_bit

// --- protótipos de funções --- //

// --- variáveis globais --- //
bit flagS1, flagS2;

// --- programa principal --- //
void main() {

  TRISA = 0b00000011; // RA0 e RA1 como entrada
  PORTA = 0b00000011; // RA0 e RA1 com resistores de pull-up

  TRISB = 0b00000000; // port B como saída
  PORTB = 0b00000000; // port B inicia em nível baixo
  
  while(1){
  
    if(!S1 && flagS1 == 0){  // se pressionou botão
      flagS1 = 1;            // seta flag
    }
    if(S1 && flagS1 == 1){   // se soltou botão
      flagS1 = 0;            // reseta flag
      L1 = ~L1;              // executa ação
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