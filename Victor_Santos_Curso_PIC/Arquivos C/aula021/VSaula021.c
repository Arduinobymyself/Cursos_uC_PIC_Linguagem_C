// --- Cabeçalho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: jan 2023
  MCU: PIC16F877A
  Título / descrição:

  aula021 - Laço de Repetição FOR
    for(incialização; condição; incremento){
      bloco_de_comandos;
    }



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

// --- variáveis globais --- //
char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
signed int i;

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
  
  Lcd_Out(1, 1, texto1);
  Lcd_Out(2, 1, texto2);


  while(1){
    /*
    // movimenta todo o display
    for(i = 1; i < 16; i++){
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      delay_ms(200);
    }
    for(i = 16; i >= 1; i--){
       Lcd_Cmd(_LCD_SHIFT_LEFT);
       delay_ms(200);
    }
    */
    
    // movimenta somente 1 linha
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1, 1, texto1);
    for(i = 1; i < 16; i++){ // rola para direita e sai pela direita
      Lcd_Out(2, i, texto2);
      delay_ms(200);
      Lcd_Out(2, 1, "                ");
    }
    for(i = -16; i < 16; i++){ // entra pela esquerda, rola e sai pela direita
      Lcd_Out(2, i, texto2);
      delay_ms(200);
      Lcd_Out(2, 1, "                ");
    }
    for(i = 16; i >= 1; i--){ // entra pela direita e rola para esquerda
      Lcd_Out(2, i, texto2);
      delay_ms(200);
      Lcd_Out(2, 1, "                ");
    }
  }

}

// --- definição das funções auxiliares --- //
