// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: jan 2023
  MCU: PIC16F877A
  Título / descrição:
         aula011
         Ao acionar o botão B0 irá acender um LED a cada vez,
         chegando ao final incializa novamente.
         
         Usando co comando switch-case
         
         aula012
         Adicionado botão B1 que ao ser acionado, apaga um
         LED por vez até todos estarem apagados.
         
         Ambos os botões dão de pull-up, acionamento em 0



*/

// --- observações e comentários gerais --- //

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define LEDs PORTD
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
bit flagB0, flagB1;
signed char cont = 0;

// --- programa principal --- //
void main() {
  CMCON = 0x07;  // desliga os comparadores internos
  TRISD = 0x00;  // port D configurado como saída digital
  PORTD = 0x00;  // port D inicia em nível baixo
  TRISB = 0x03;  // port B RB1 e RB2 configurado com entrada digital


  while(1){
  
    if(!B0 && flagB0 == 0){
      flagB0 = 1;
    }
    if(B0 && flagB0 == 1){
      cont++;
      if(cont >= 8){ // esse if() é irrelevante
        cont = 8;
      }
      flagB0 = 0;
    }
    
    // adicionado na aula012
    if(!B1 && flagB1 == 0){
      flagB1 = 1;
    }
    if(B1 && flagB1 == 1){
      cont--;
      if(cont <= 0){ // esse if() é irrelevante
        cont = 0;
      }
      flagB1 = 0;
    }

    switch(cont){
      case 0: LEDs = 0b00000000; break;
      case 1: LEDs = 0b00000001; break;
      case 2: LEDs = 0b00000010; break;
      case 3: LEDs = 0b00000100; break;
      case 4: LEDs = 0b00001000; break;
      case 5: LEDs = 0b00010000; break;
      case 6: LEDs = 0b00100000; break;
      case 7: LEDs = 0b01000000; break;
      case 8: LEDs = 0b10000000; break;
      //default: cont = 0; break; //comentado devido a adição dos if()s
    }

  }
}

// --- definição das funções auxiliares --- //