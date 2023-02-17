// --- Cabe�alho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: 27/12/2022
  MCU: PIC16F877A
  T�tulo / descri��o:
  
  aula014 - ESTUDANDO LCDs
  1. usando as bibliotecas Lcd e Lcd_Constants
  2. Lcd_Chr_CP('caractere') escreve caractere �nico na posi��o atual do cursor
  3. Lcd_Out_CP("texto") escreve texto na posi��o atual do cursor
  4. Lcd_out(linha, coluna, "texto") escreve texto na posi��o desejada
  5. Lcd_Cmd(comando) envia comandos de configura��o ao display




*/

// --- observa��es e coment�rios gerais --- //

// --- inclus�o de bibliotecas --- //

// --- defini��es de par�metros do sistema ---//
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
#define B0 RA0_bit



// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //


// --- programa principal --- //
void main() {
  CMCON = 0x07;  // desliga os comparadores internos
  TRISD = 0x00;  // port D configurado como sa�da digital
  PORTD = 0x00;  // port D inicia em n�vel baixo
  TRISA = 0b00000001;  // RA0 como entrada digital B0
  PORTA = 0X00;

  Lcd_Init();
  
  /*
  Lcd_chr_CP('a'); // escreve um caracter �nico
  Lcd_chr_CP(' ');
  Lcd_chr_CP('5');
  Lcd_Out_CP("  ABMS Telecom  ");  // escreve um teste a partir da posi��o atual do cursor
  Lcd_Out(2, 1, "Texto"); // escreve o texto a partir de uma posi��o definida em linha e coluna
  */

  //enviando comandos espec�ficos aula015
  //Lcd_Cmd(_LCD_CLEAR); // limpa tela posiciona cursor na linha 1 coluna 1
  //Lcd_Cmd(_LCD_CURSOR_OFF); // desliga cursor
  //Lcd_Cmd(_LCD_CURSOR_ON);
  //Lcd_Cmd(_LCD_FIRST_ROW); // posiciona primeira linha primeira coluna
  //Lcd_Cmd(_LCD_SECOND_ROW); // posiciona segunda linha coluna 1
  //Lcd_Cmd(_LCD_RETURN_HOME); // retorna linha 1 coluna 1
  //Lcd_Cmd(_LCD_TURN_OFF); // desliga o LCD sem apagar conte�do
  //Lcd_Cmd(_LCD_TURN_ON) // religa o LCD
  //Lcd_Cmd(_LCD_UNDERLINE_ON); // liga o undeline abaixo do cursor
  //Lcd_Cmd(_LCD_SHIFT_LEFT); // movimento todo o LCD para a esquerda em uma coluna
  //Lcd_Cmd(_LCD_SHIFT_RIGHT); // movimenta todo o LCD para a direita em uma coluna
  //Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT); // movimenta cursor uma posi��o � esquerda
  //Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT); // movimenta cursor uma posi��o � direita
  //Lcd_Cmd(_LCD_BLINK_CURSOR_ON); // cursor piscante

  
  
  
  

  while(1){
    Lcd_Out(1, 1, "  ABMS Telecom  ");
    Lcd_Out(2, 1, " Seja Bem Vindo!");
    delay_ms(2000);
    Lcd_Out(1, 1, "  Linguagem C   ");
    Lcd_Out(2, 1, "   MikroC PRO   ");
    delay_ms(2000);
  }
    
}

// --- defini��o das fun��es auxiliares --- //