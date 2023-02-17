// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: 27/12/2022
  MCU: PIC16F877A
  Título / descrição:
  1. estudo das entradas
  2. botões
  3. debouncing por hw
  4. debouncing por sw
  5. biblioteca button
  6. inversão de estados
  7. uso de flags
  8. diretiva define



*/

// --- observações e comentários gerais --- //

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define S0 rb0_bit
#define S1 rb1_bit
#define L6 rd6_bit
#define L7 rd7_bit

#define B0 Button(&PORTB, 0, 50, 1)
#define B1 Button(&PORTB, 1, 50, 0)

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
bit flagS0, flagS1;

// --- programa principal --- //
void main() {
    CMCON = 0x07;  // desliga os comparadores internos
    TRISD = 0x00;  // port D configurado como saída digital
    PORTD = 0x00;  // port D inicia em nível baixo
    TRISB = 0x03;  // port B RB1 e RB2 configurado com entrada digital


    while(1){
        /*
        // modo usual de tratamento de debouncing via sw
        if(S0 == 1){
            delay_ms(50); // debouncing por sw
            if(S0 == 1) L6 = 1; // se e somente se depois de passado o tempo, aciona o LED
        } else{
                L6 = 0;
        }
              if(S1 == 0){
              delay_ms(50);  // debouncing por sw
              if(S1 == 0)  L7 =1;  // se e somente se depois de passado o tempo, aciona o LED
              }
              else{
                L7 = 0;
        }
        */

        /*
        // quando S0 acionado, acende os dois LEDs
        // quando S1 acionado, apaga os dois LEDs
        if (Button(&PORTB, 0, 50, 1)){
          L6 = 1;
          L7 = 1;
        }
        else {
          if (Button(&PORTB, 1, 50, 0)){
             L6 = 0;
             L7 = 0;
          }
        }
        */
        
        /*
        // invertendo o estado dos LEDs
        if (Button(&PORTB, 0, 50, 1)){
            L6 = ~L6;
        }
        if (Button(&PORTB, 1, 50, 0)){
            L7 = ~L7;
        }
        delay_ms(200); // delay para evitar o efeito de flikering se o usuário manter o botão pressionado por muito tempo
        */
        
        
        /*
        // resolvendo o problema do flickering, usando flags e sem delay  (aula 009)
        if (Button(&PORTB, 0, 50, 1) && flagS0 == 0){
            L6 = ~L6;
            flagS0 = 1;
        }
        if (Button(&PORTB, 1, 50, 0) && flagS1 == 0){
            L7 = ~L7;
            flagS1 = 1;
        }
        if (!Button(&PORTB, 0, 50, 1) && flagS0 == 1){
            flagS0 = 0;
        }
        if (!Button(&PORTB, 1, 50, 0) && flagS1 == 1){
            flagS1 = 0;
        }
        */
        
        /*
        // resolvendo o problema de acionar somente ao soltar o botão   (aula 010)
        if (Button(&PORTB, 0, 50, 1) && flagS0 == 0){
            flagS0 = 1;
        }
        if (Button(&PORTB, 1, 50, 0) && flagS1 == 0){
            flagS1 = 1;
        }
        if (!Button(&PORTB, 0, 50, 1) && flagS0 == 1){
            L6 = ~L6;
            flagS0 = 0;
        }
        if (!Button(&PORTB, 1, 50, 0) && flagS1 == 1){
            L7 = ~L7;
            flagS1 = 0;
        }
        */
        
        // usando a diretiva define para os botões  (aula010)
        if (B0 && flagS0 == 0){
            flagS0 = 1;
        }
        if (B1 && flagS1 == 0){
            flagS1 = 1;
        }
        if (!B0 && flagS0 == 1){
            L6 = ~L6;
            flagS0 = 0;
        }
        if (!B1 && flagS1 == 1){
            L7 = ~L7;
            flagS1 = 0;
        }
        
        
        
        
    }
}

// --- definição das funções auxiliares --- //