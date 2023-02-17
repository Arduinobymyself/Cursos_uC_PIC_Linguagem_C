/*
  Este programa tem como finalidade esvrever a mensagem "ABMS Telecom"
  na primeira linha do LCD e na segunda linha "Seja Bem vindo!"
  trabalhando no modo 4 bits com cursor desligado
*/

// pinagem do display
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

// declaração de variáveis
char txt1[] = "  ABMS Telecom  ";
char txt2[] = " Seja Bem Vindo!";

void main() {
  CMCON = 7;
  ADCON1 = 7;
  TRISD = 0;
  PORTD = 0;
  Lcd_init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1, 1, txt1);
  Lcd_Out(2, 1, txt2);
}