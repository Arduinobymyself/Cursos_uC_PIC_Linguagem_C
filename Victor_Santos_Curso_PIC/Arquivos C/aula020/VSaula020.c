// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: 27/12/2022
  MCU: PIC16F877A
  Título / descrição:

  aula020 - LCD - Uso de funções
    - pressionando botão B0, inverte estado do LED L0
    -



*/

// --- observações e comentários gerais --- //

// --- inclusão de bibliotecas --- //

// --- definições de parâmetros do sistema ---//
// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
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
void inverte_led();
void escreve_lcd();

// --- variáveis globais --- //
bit flagB0;
unsigned char cont = 0;

char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
char texto3[4];

// --- programa principal --- //
void main() {
  CMCON = 0x07;  // desliga os comparadores internos
  TRISD = 0x00;  // port D configurado como saída digital
  PORTD = 0x00;  // port D inicia em nível baixo
  TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1

  Lcd_Init();                 // inicializa o LCD
  Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
  Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no início

  escreve_lcd();
  delay_ms(2000);

  while(1){
    
    if(!B0 && flagB0 == 0){
      flagB0 = 1;
    }
    if(B0 && flagB0 == 1){
      flagB0 = 0;
      inverte_led();
      cont++;
      Lcd_Cmd(_LCD_CLEAR);
      ByteToStrWithZeros(cont, texto3);
      Lcd_Out(2, 1, "B0 = ");
      Lcd_Out(2, 6, texto3);
    }
    
  }

}

// --- definição das funções auxiliares --- //
void inverte_led(){
  L0 = ~L0;
}

void escreve_lcd(){
  Lcd_Out(1, 1, texto1);
  Lcd_Out(2, 1, texto2);
}

