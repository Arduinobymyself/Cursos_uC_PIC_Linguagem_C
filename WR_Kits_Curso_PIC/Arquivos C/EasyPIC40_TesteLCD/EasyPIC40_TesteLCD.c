// Lcd pinout settings
sbit LCD_RS at RA1_bit;
sbit LCD_EN at RA3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISA1_bit;
sbit LCD_EN_Direction at TRISA3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

const char character[] = {0,10,0,4,4,17,14,0};
int teste = 76;

void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}




void main() {
  ADCON0 = 0b00000001;
  ADCON1 = 0b00001110;             // todos os pinos como digital
  
  TRISA = 0b00000000;               // PORT A como saída
  PORTA = 0b00000000;               // PORT A incia em low
  TRISD = 0b00000100;               // PORT D como saída
  PORTD = 0b00000001;               // PORT D  inicia em low
  
  Lcd_Init();                       // inicializa o LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);         // desliga cursor
  Lcd_Cmd(_LCD_CLEAR);              // limpa LCD

  while(1){
    Lcd_Out(1, 1, "  ABMS Telecom  ");
    Lcd_Out(2, 1, "      IOT       ");
    delay_ms(500);
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Out(1, 1, "Bem vindo!");
    CustomChar(1, 12);
    Lcd_Chr_Cp(teste + 48);
    delay_ms(500);
  }

}