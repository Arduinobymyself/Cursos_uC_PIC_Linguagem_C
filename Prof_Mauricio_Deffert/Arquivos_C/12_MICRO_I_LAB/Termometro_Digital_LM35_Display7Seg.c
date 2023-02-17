// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Fev 2023
  MCU:                      PIC16F877A
  Descrição do Projeto:

*/

/*
  CONVERSOR A/D
  Termometro Digital LM35 e Display 7 Segmentos
  DISP1 e DISP2 (RC4 e RC5)
  Leitura do canal analógico AN1(RA1) LM35
  
  Ao ligar o uC, os displays mostram a tempreatura ambiente
  Ao acionar o botão B0(MÁX) os displays mostram a temperatura máxima medida
  Ao acionar o botão B1(MÍN) os displays mostram a temperatura Mínima medida
  volta a condição inicial após novo pressionamento do referido botão
  
*/

// --- inclusão de bibliotecas --- //

// --- definições do sistema --- //
#define B0  Button(&PORTB, 0, 50, 0)
#define B1  Button(&PORTB, 1, 50, 0)

// --- protótipod das funções auxiliares --- //
void display(unsigned char temp);

// --- variáveis globais --- //
unsigned int leituraAD;
unsigned char minima, maxima;
unsigned char temperatura = 0;
unsigned char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
bit flagB0, flagB1;


// --- programa principal --- //
void main() {

  TRISD = 0b00000000;        // configura PORT D  como saída
  PORTD = 0b00000000;        // inicia em nível baixo
  TRISB = 0b00000011;        // RB0 e RB1 como entrada (botões)
  PORTB = 0b00000011;        // RB0 e RB1 são botões com pull-up
  TRISC = 0b00000000;
  PORTC = 0b00000000;

  TRISA1_bit = 1;            // AN1(RA1) configurado como entrada
  ADC_Init();                // inicializa o ADC com configurações padrão (clock interno RC)
  
  minima = 99;
  maxima = 0;
  
  while(1){

    leituraAD = ADC_Read(1);   // lê o canal analógico 1; converte tensão para valor digital
                               // 5V -> 1023

    temperatura = leituraAD*0.4887; // 1023 -> 500ºC; converte valor digital em temperatura
    
    // testa os limites
    if(temperatura > 99) temperatura = 99;
    if(temperatura < 0) temperatura = 0;
    
    // armazena a máxima e mínima temperatura medida
    if(temperatura > maxima) maxima = temperatura;
    if(temperatura < minima) minima = temperatura;
    
    display(temperatura);  // chama a função que mostra a temperatura no display
    
    // botão B0 mostra a máxima temperatura
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
    
    // botão B1 mostra a mínima temperatura
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

// --- funções auxiliares --- //
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