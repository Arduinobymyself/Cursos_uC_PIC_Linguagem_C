// --- Cabeçalho do programa --- //
/*
  Nome do Projeto:
  Autor:                    Marcelo Moraes
  Local:                    Sorocaba - SP
  Data:                     Jun 2023
  MCU:                      PIC16F628A
  Descrição do Projeto:

  Aula052: Interrupções do TIMER 0 e TIMER 1 Juntas

  Clock: 4MHz
  Ciclo de Máquina: 1us
  Sistema Embarcado PARADOXUS 9
  

  


*/

// --- observações e comentários gerais --- //
/*

1) Configurar o estouro do TIMER 0 para controlar o piscar do backlight de um
  display LCD a cada 0,5 segundo

  Equação de estouro do TIMER 0:

  TMR0 = TempoEstouroDesejado / (Prescaler * CicloMaquina) = 1ms / (4 * 1us) = 250

  Valor incial do TMR0 = 256 - 250 = 6

  2) Configurar o estouro do TIMER 1 para alternar a frase mostrada no
  diplay LCD a cada 1 segundo

  Equação de estouro do TIMER 1:

  TempoEstouro = TMR1 * Prescaler * CicloMaquina = 100ms / (8 * 1us) = 12500

  Valor inicial do TMR1 = 65536 - 12500 = 53036

  TMR1L = 256

  TMR1 - TMR1L = 53036 - 256 = 52780

  TMR1H = 52780 / 256 = 206,1718 ~= 206


  Portanto:
  TMR1L = 256
  TMR1H = 206

*/

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// Lcd pinout settings
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

#define L1            RA3_bit
#define L2            RA2_bit
#define S1            RA1_bit
#define S2            RA0_bit
#define backlight     RB2_bit


// --- protótipo das funçãoes --- //
void interrupt();


// --- variáveis globais --- //
char txt[12];
char* text1 = "Testing...      ";
char* text2 = "    ...interrupt";

int counter0 = 0x00;
int counter1 = 0x00;

bit change;


// --- programa principal --- //
void main() {

  CMCON = 0X07;                // desabilita compardores internos
  T1CON = 0X31;                // habilita contagem do Timer 1, com prescaler 1:8
  OPTION_REG = 0x81;            // Pull-ups desabilitados, Prescaler 1:4 associado ao TIMER 0
  GIE_bit = 0x01;              // habilita interrupção global
  PEIE_bit = 0x01;             // habilita interrupção por periféricos
  T0IE_bit = 0x01;             // habilita interrupção por TIMER 0
  TMR1IE_bit = 0x01;           // habilita interrupção por TIMER 1, registrador PIE1 e PIR1 (TMRIF_bit)
  
  TMR0 = 0X06;                 // inicializa TMR0
  TMR1L = 255;                 // inicializa TMR1L
  TMR1H = 206;                 // inicializa TMR1H
  
  TRISA = 0XFF;                // configura o PORT A como entrada
  TRISB = 0X00;                // configura RB2 e RB3 como entrada 0b00001100
  PORTA = 0XFF;                // inicializa o PORT A
  PORTB = 0X00;                // inicializa o PORT B
  
  change = 0x00;

  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, text1);
  Lcd_Out(2, 14, text2);
  delay_ms(100);

  while(1)
  {
    if(!change) Lcd_Out(1, 1, text1);
    else Lcd_Out(1, 1, text2);
  }

}

// --- definição das funções auxiliares --- //
void interrupt(){

  if(T0IF_bit){ // houve estouro do TMR0?
    // sim...
    T0IF_bit = 0x00;                    // limpa a flag
    TMR0 = 0x06;                        // reincia TMR0
    counter0++;                         // incrementa counter 0
    if(counter0 == 500){                // counter igual a 500? 500*1ms = 500ms
      // sim...
      counter0 = 0x00;                  // reincia counter 0
      backlight = ~backlight;           // inverte estado do backlight
    }
  }
  
  if(TMR1IF_bit){ // houve estouro do TMR1?
    // sim...
    TMR1IF_bit = 0x00;                  // limpa a flag
    TMR1L = 255;                        // reincia TMR1
    TMR1H = 206;
    counter1++;                         // incrementa counter 1
    if(counter1 == 10){                 // counter igual a 10? 10*100ms = 1s
      // sim...
      counter1 = 0x00;                  // reincia counter 1
      change = ~change;                 // inverte variável de controle de mensagens
      RB3_bit = ~RB3_bit;               // inverte estado do pino RB3
    }
  }
  
}