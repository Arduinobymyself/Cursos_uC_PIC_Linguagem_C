// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: jan 2023
  MCU: PIC16F877A
  Título / descrição:

  aula025 - Configuração e Leitura do ADC
  
  Este programa foi preparado para simular 
  no PicSimLab placa PicGênios com 16F877A



*/

// --- observações e comentários gerais --- //

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//

// Lcd pinout settings
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

// defines
#define L0 RD0_bit
#define L1 RD1_bit
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)

// --- protótipo das funçãoes --- //

// --- variáveis globais --- //
char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
unsigned int valorAD0 = 0;
unsigned int valorAD1 = 0;
unsigned char texto3[6];
unsigned char texto4[6];
bit flagB0;

// --- programa principal --- //
void main() {

  ADCON0 = 0b00000000; // Fosc/4
  ADCON1 = 0b11000100; // justificado a direita, canais RA0/AN0, RA1/AN1 e RA3/AN3 configurados como analógico
  TRISA = 0b00000011; // canais AN0 e AN1 como entrada

  TRISB.RB0 = 1;
  TRISB.RB1 = 1;
  TRISD = 0x00;  // port D configurado como saída digital
  PORTD = 0x00;  // port D inicia em nível baixo
  TRISE = 0x00;
  PORTE = 0x00;
  

  Lcd_Init();                 // inicializa o LCD
  Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
  Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início

  Lcd_Out(1, 1, texto1);
  Lcd_Out(2, 1, texto2);
  delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "AN0 = ");
  Lcd_Out(2, 1, "AN1 = ");

  while(1){
    // lendo canal 0
    ADCON0.CHS2 = 0;       // selecionam o canal AN0
    ADCON0.CHS1 = 0;
    ADCON0.CHS0 = 0;
    ADCON0.ADON = 1;       // ativa conversor A/D
    delay_us(20);          // tempo de espera da ativação
    ADCON0.GO_DONE = 1;    // inicia o processo de conversão
    while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado

    valorAD0 = (ADRESH << 8) + ADRESL; // pega o valor da conversão

    ADCON0.ADON = 0;
    delay_us(20);

    WordToStr(valorAD0, texto3);
    Lcd_Out(1, 7, texto3);

    // lendo canal 1
    ADCON0.CHS2 = 0;       // selecionam o canal AN1
    ADCON0.CHS1 = 0;
    ADCON0.CHS0 = 1;
    ADCON0.ADON = 1;       // ativa conversor A/D
    delay_us(20);          // tempo de espera da ativação
    ADCON0.GO_DONE = 1;    // inicia o processo de conversão
    while(ADCON0.GO_DONE); // enquanto a conversão estiver em processo, fica pausado

    valorAD1 = (ADRESH << 8) + ADRESL; // pega o valor da conversão

    ADCON0.ADON = 0;
    delay_us(20);

    WordToStr(valorAD1, texto4);
    Lcd_Out(2, 7, texto4);
    
    
    // acionando Led0 (RD0) via Botão0 (RB0)
    if(!B0 && flagB0 == 0){
      flagB0 = 1;
    }
    if(B0 && flagB0 == 1){
      L0 = ~L0;
      flagB0 = 0;
    }


  }

}

// --- definição das funções auxiliares --- //