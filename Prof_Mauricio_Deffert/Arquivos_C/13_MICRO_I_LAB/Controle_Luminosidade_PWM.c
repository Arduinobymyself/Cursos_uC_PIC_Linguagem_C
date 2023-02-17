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
  CONVERSOR A/D  e PWM
  Controle de Luminosidade Ambiente com LDR e Display 7 Segmentos
  DISP1 e DISP2 (RC6 e RC7)
  Leitura do canal anal�gico AN1(RA1) LDR

  Ao ligar o uC, os displays mostram a luminosidade ambiente em %
  Ao acionar o bot�o B0(M�X) os displays mostram a intensidade luminosa m�xima medida
  Ao acionar o bot�o B1(M�N) os displays mostram a intensidade luminosa m�nima medida
  volta a condi��o inicial ap�s novo pressionamento do referido bot�o

*/

// --- inclus�o de bibliotecas --- //

// --- defini��es do sistema --- //
#define B0  Button(&PORTB, 0, 50, 0)
#define B1  Button(&PORTB, 1, 50, 0)

// --- prot�tipod das fun��es auxiliares --- //
void display(unsigned char lux);

// --- vari�veis globais --- //
unsigned int leituraAD;
unsigned char minima, maxima;
unsigned char luminosidade = 0;
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

  TRISA0_bit = 1;            // AN0(RA0) configurado como entrada
  ADC_Init();                // inicializa o ADC com configura��es padr�o (clock interno RC)
  PWM1_Init(500);            // inicializa o m�dulo PWM em 500Hz
  PWM1_Start();              // inicia o PWM
  

  minima = 99;
  maxima = 0;

  while(1){

    leituraAD = ADC_Read(0);   // l� o canal anal�gico 1; converte tens�o para valor digital
                               // 5V -> 1023

    luminosidade = leituraAD*0.0978; // 1023 -> 100% ; converte valor digital intensidade luminosa
    PWM1_Set_Duty(leituraAD/4);      // seta o duty-cycle de acordo com a intensidade luminosa
                                     // divide por 4 para transformar de 10 bits para 8 bits
                                     
    // testa os limites
    if(luminosidade > 99) luminosidade = 99;
    if(luminosidade < 0) luminosidade = 0;

    // armazena a m�xima e m�nima intensidade luminosa medida
    if(luminosidade > maxima) maxima = luminosidade;
    if(luminosidade < minima) minima = luminosidade;

    display(luminosidade);  // chama a fun��o que mostra a luminosidade no display

    // bot�o B0 mostra a m�xima luminosidade
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

    // bot�o B1 mostra a m�nima luminosidade
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
void display(unsigned char lux){

  char dezena, unidade;

  dezena = lux/10;
  RC6_bit = 1;
  PORTD = digitos[dezena];
  delay_ms(2);
  RC6_bit = 0;
  PORTD = 0;

  unidade = lux%10;
  RC7_bit = 1;
  PORTD = digitos[unidade];
  delay_ms(2);
  RC7_bit = 0;
  PORTD = 0;

}