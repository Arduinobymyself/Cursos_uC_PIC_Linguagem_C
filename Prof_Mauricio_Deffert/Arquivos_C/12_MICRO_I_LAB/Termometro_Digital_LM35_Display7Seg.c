// --- Cabe�alho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Fev 2023
  MCU:                      PIC16F877A
  Descri��o do Projeto:

*/

/*
  CONVERSOR A/D
  Termometro Digital LM35 e Display 7 Segmentos
  DISP1 e DISP2 (RC4 e RC5)
  Leitura do canal anal�gico AN1(RA1) LM35
  
  Ao ligar o uC, os displays mostram a tempreatura ambiente
  Ao acionar o bot�o B0(M�X) os displays mostram a temperatura m�xima medida
  Ao acionar o bot�o B1(M�N) os displays mostram a temperatura M�nima medida
  volta a condi��o inicial ap�s novo pressionamento do referido bot�o
  
*/

// --- inclus�o de bibliotecas --- //

// --- defini��es do sistema --- //
#define B0  Button(&PORTB, 0, 50, 0)
#define B1  Button(&PORTB, 1, 50, 0)

// --- prot�tipod das fun��es auxiliares --- //
void display(unsigned char temp);

// --- vari�veis globais --- //
unsigned int leituraAD;
unsigned char minima, maxima;
unsigned char temperatura = 0;
unsigned char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
bit flagB0, flagB1;


// --- programa principal --- //
void main() {

  TRISD = 0b00000000;        // configura PORT D  como sa�da
  PORTD = 0b00000000;        // inicia em n�vel baixo
  TRISB = 0b00000011;        // RB0 e RB1 como entrada (bot�es)
  PORTB = 0b00000011;        // RB0 e RB1 s�o bot�es com pull-up
  TRISC = 0b00000000;
  PORTC = 0b00000000;

  TRISA1_bit = 1;            // AN1(RA1) configurado como entrada
  ADC_Init();                // inicializa o ADC com configura��es padr�o (clock interno RC)
  
  minima = 99;
  maxima = 0;
  
  while(1){

    leituraAD = ADC_Read(1);   // l� o canal anal�gico 1; converte tens�o para valor digital
                               // 5V -> 1023

    temperatura = leituraAD*0.4887; // 1023 -> 500�C; converte valor digital em temperatura
    
    // testa os limites
    if(temperatura > 99) temperatura = 99;
    if(temperatura < 0) temperatura = 0;
    
    // armazena a m�xima e m�nima temperatura medida
    if(temperatura > maxima) maxima = temperatura;
    if(temperatura < minima) minima = temperatura;
    
    display(temperatura);  // chama a fun��o que mostra a temperatura no display
    
    // bot�o B0 mostra a m�xima temperatura
    if(Button(&PORTB, 0, 10, 0)){
      flagB0 = 1;
    }
    if(Button(&PORTB, 0, 10, 1) && flagB0){
      flagB0 = 0;
      while(1){
      display(maxima);
      if(Button(&PORTB, 0, 10, 0)){
        flagB0 = 1;
      }
      if(Button(&PORTB, 0, 10, 1) && flagB0){
        flagB0 = 0;
        break;
      }
      
      }
    }
    
    // bot�o B1 mostra a m�nima temperatura
    if(Button(&PORTB, 1, 10, 0)){
      flagB1 = 1;
    }
    if(Button(&PORTB, 1, 10, 1) && flagB1){
      flagB1 = 0;
      while(1){
      display(minima);
      if(Button(&PORTB, 1, 10, 0)){
        flagB1 = 1;
      }
      if(Button(&PORTB, 1, 10, 1) && flagB1){
        flagB1 = 0;
        break;
      }

      }
    }
    
  }
  
}

// --- fun��es auxiliares --- //
// mostra uma temperatura no display
void display(unsigned char temp){

  char dezena, unidade;
  
  dezena = temp/10;
  RC4_bit = 1;
  PORTD = digitos[dezena];
  delay_ms(2);
  RC4_bit = 0;
  PORTD = 0;

  unidade = temp%10;
  RC5_bit = 1;
  PORTD = digitos[unidade];
  delay_ms(2);
  RC5_bit = 0;
  PORTD = 0;

}