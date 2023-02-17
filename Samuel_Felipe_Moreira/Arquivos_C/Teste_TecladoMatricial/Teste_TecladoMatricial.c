/***************************************************************************
Curso: Programação C - microcontrolador PIC
Compilador: mikroC 8.0
Kit: Kit PICGenios
Cristal: 8MHz
MCU: PIC16F877A
Obejtivo: Este programa tem por objetivo ler um teclado Matricial e
enviar o valor de cada tecla para o display LCD.
***************************************************************************/
//**************************** subrotina de inicialização dolcd ************

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

char var1;

void lcdr(char a[5]){
  TRISD = 0;
  Lcd_Cmd(_LCD_CLEAR);
  LCD_Out_CP(a);
  TRISD = 255;
}
//******************** programa principal *********************************
void main() {

  char var2; //define variável
  ADCON1 = 0x15; //define pinos AD como I/O de uso geral
  TRISE = 0;
  TRISD = 0;
  //configura porta como saida
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  delay_ms(100);
  TRISD = 255;
  PORTB = 255; //portb em FF
  PORTD = 255; //portd em FF
  TRISD = 255; //configura portd como entrada
  TRISB = 0;   //configura portb como saida



  //-------------------------------------------------------------------------
  //inicio do programa de varredura do teclado matricial
  //--------------------------------------------------------------------------
  do {
  
    PORTB.RB0 = 0; //habilita primeira coluna do teclado
    var2 = PORTD;
    if (var2.f0 == 0) lcdr("<--");
    else if (var2.f1 == 0) lcdr("7");
    else if (var2.f2 == 0) lcdr("4");
    else if (var2.f3 == 0) lcdr("1");
    PORTB.RB0 = 1; //desabilita primeira coluna do teclado
    //--------------------------------------------------------------------------
    PORTB.RB1 = 0; //habilita segunda coluna do teclado
    var2 = PORTD;
    if (var2.f0 == 0) lcdr("0");
    else if (var2.f1 == 0) lcdr("8");
    else if (var2.f2 == 0) lcdr("5");
    else if (var2.f3 == 0) lcdr("2");
    PORTB.RB1 = 1; //desabilita segunda coluna do teclado
    //------------------------------------------------------------------------
    PORTB.RB2 = 0; //habilita terceira coluna do teclado
    var2 = PORTD;
    if (var2.f0 == 0) lcdr("-->");
    else if (var2.f1 == 0) lcdr("9");
    else if (var2.f2 == 0) lcdr("6");
    else if (var2.f3 == 0) lcdr("3");
    PORTB.RB2 = 1; //desabilita terceira coluna do teclado
    delay_ms(100);
  
  } while(1);

}
