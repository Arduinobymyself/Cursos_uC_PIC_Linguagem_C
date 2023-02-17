// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jan 2023
  MCU:                      PIC16F877A (8MHz)
  Descrição do Projeto:
            Timer de Contagem Regressiva
            
            Conta de 99 a 00, quando chega em 00 fica piscando 
            o display e tocando um buzzer
            
            PORT D -> Display 7-Seg (dados) RC0 ~ RC7 (a ~ dp)
            PORT C -> Display (controle) RC4(disp1) RC5(disp2)
            PORT B -> Botões B0 ~ B7
            
            B0 -> configura valor inicial no display
            B1 -> inicia contagem regressiva
            B2 -> pausa e continua a contagem
            
            p/ TE = 25ms -> CI = 61
            


*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
#define B0 Button(&PORTB, 0, 100, 0)
#define B1 Button(&PORTB, 1, 100, 0)
#define B2 Button(&PORTB, 2, 100, 0)

// --- protótipo das funçãoes --- //
void interrupt();
void config_mcu();
void config_interrupt();
void config_timer();
void display_unidade();
void display_dezena();
void start();
void pause();
void clear();
void blink();


// --- variáveis globais --- //
char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
unsigned char unidade, dezena, num, lastNum;
unsigned char contador;

bit pauseFlag, startFlag, clearFlag, blinkFlag;
bit flagB0, flagB1, flagB2;

// --- programa principal --- //
void main() {

  config_mcu();
  config_interrupt();
  config_timer();
  
  
  clearFlag = 1;
  INTCON.TMR0IE = 0;
  num = 10;

  while(1){

    clear();
    start();
    pause();
    
    if(B0 && flagB0 == 0){ // incrementa +1
      flagB0 = 1;
    }
    if(!B0 && flagB0 == 1){
      flagB0 = 0;
      if(pauseFlag) num++;
      if(num == 99) num = 0;
    }

    if(B1 && flagB1 == 0){ // inicia contagem
      flagB1 = 1;
    }
    if(!B1 && flagB1 == 1){
      flagB1 = 0;
      startFlag = 1;
      pauseFlag = 0;
      INTCON.TMR0IE = 1;
    }
    
    if(B2 && flagB2 == 0){ // pausa e continua
      flagB2 = 1;
    }
    if(!B2 && flagB2 == 1){
      flagB2 = 0;
      startFlag = !startFlag;
      pauseFlag = !pauseFlag;
      INTCON.TMR0IE = !INTCON.TMR0IE;
    }

  }

}

// --- desenvolvimento das funções auxiliares --- //

void start(){

  lastNum = num;
  
  if(startFlag && !pauseFlag){
    if(num == 0) num = 0;
    display_unidade();
    display_dezena();
  }

}

void pause(){

  if(pauseFlag && !startFlag){
    num = lastNum;
    display_unidade();
    display_dezena();
  }

}

void clear(){

  if(clearFlag){
    display_unidade();
    display_dezena();
  }

}

void blink(){

  while(blinkFlag){
    display_unidade();
    display_dezena();
    delay_ms(500);
  }

}

void config_mcu(){

  ADCON1 = 7; // entradas nanalógicas desabilitadas
  CMCON = 7;  // comparadores desabilitados

  TRISD = 0;  // PORT D como saída digital
  PORTD = 0;  // PORT D iniciaem nível baixo
  TRISC = 0;  // PORT C como saída digital
  PORTC = 0;  // PORT C iniciaem nível baixo
  

}

void config_interrupt(){

  INTCON.GIE = 1;    // habilita chave geral de interrupções
  INTCON.PEIE = 0;   // não necessário
  INTCON.TMR0IE = 1; // habilita interrupção por Timer 0

}

void config_timer(){

  OPTION_REG = 0b10000111;    // modo temporizador, prescaler 1:256
  TMR0 = 61;                  // carregamento do valor inicial do registrador
  INTCON.TMR0IF = 0;          // incializa o flag de estouro

}

void interrupt(){

  if(INTCON.TMR0IF){
    contador++;
    if(contador == 40){
      num--;
      if(num == 0){
        num = 0;
        blinkFlag = 1;
        INTCON.TMR0IE = 0;
        blink();
      }
      contador = 0;
    }
    TMR0 = 61;
    INTCON.TMR0IF = 0;
  }

}

void display_dezena(){

  PORTC.RC4 = 1;
  dezena = num/10;
  PORTD = digitos[dezena];
  delay_ms(5);
  PORTC.RC4 = 0;
  PORTD = 0;

}
void display_unidade(){

  PORTC.RC5 = 1;
  unidade = num%10;
  PORTD = digitos[unidade];
  delay_ms(5);
  PORTC.RC5 = 0;
  PORTD = 0;

}