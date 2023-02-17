// --- Cabe�alho do programa --- //
/*
  Projeto: Estudos do uC PIC16F877A
  Autor: Marcelo Moraes
  Local: Sorocaba - SP
  Data: jan 2023
  MCU: PIC16F877A
  T�tulo / descri��o:

  aula023 - La�o de Repeti��o WHILE e DO-WHILE
    while(condi��o){
      bloco_de_comandos;
    }
    
    do{
      bloco_de_comandos;
    }while(condi��o);



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
#define L1 RD1_bit
#define B0 Button(&PORTB, 0, 50, 0)
#define B1 Button(&PORTB, 1, 50, 0)

// --- prot�tipo das fun��oes --- //

// --- vari�veis globais --- //
char texto1[] = "  ABMS Telecom  ";
char texto2[] = " Seja Bem Vindo!";
signed int i;

// --- programa principal --- //
void main() {
  CMCON = 0x07;  // desliga os comparadores internos
  TRISD = 0x00;  // port D configurado como sa�da digital
  PORTD = 0x00;  // port D inicia em n�vel baixo
  TRISB = 0b00000011;  // RA0 e RA1 como entrada digital B0 e B1

  Lcd_Init();                 // inicializa o LCD
  Lcd_Cmd(_LCD_CLEAR);        // limpa LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);   // desliga o cursor
  Lcd_Cmd(_LCD_RETURN_HOME);  // posiciona cursor no in�cio

  Lcd_Out(1, 1, texto1);
  Lcd_Out(2, 1, texto2);
  delay_ms(2000);


  while(1){
    /*
    // movimenta todo o display (exemplo com while)
    while(i < 16){
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      delay_ms(200);
      i++;
    }
    while(i >= 1){
       Lcd_Cmd(_LCD_SHIFT_LEFT);
       delay_ms(200);
       i--;
    }
    */
    
    // movimenta somente uma linha (exemplo com do-while)
    i = -16;
    Lcd_Out(2, 1, "                ");
    do{
      Lcd_Out(2, i, texto2);
      delay_ms(200);
      i++;
    }while(i <= 16);
    
    
  }

}

// --- defini��o das fun��es auxiliares --- //
