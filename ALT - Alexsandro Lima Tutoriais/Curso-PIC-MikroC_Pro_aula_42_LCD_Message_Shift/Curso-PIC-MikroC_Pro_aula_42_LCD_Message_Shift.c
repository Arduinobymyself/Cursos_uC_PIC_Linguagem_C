// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 42 LCD Rolar mensage e caracter customizado

// Direção dos pinos
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

// LCD configuração de pinos
sbit LCD_EN at RB5_bit;
sbit LCD_RS at RB4_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

unsigned short int contador;

const char smile[] = {0,10,10,0,17,14,0,0};

void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(smile[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

void main() {
  Lcd_Init();// inicializa o LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);// não mostrar o cursor
  Lcd_Out(1,1,"     ABMS"); // apresenta mensagem Inicial
  CustomChar(1,11);
  Lcd_Out(2,1,"ArduinoByMySelf");
  

  // exibe mensagem rolando no LCD
  while(1){
    for(contador = 0; contador < 16; contador++){
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      delay_ms(100);
    }
    for(contador = 0; contador < 32; contador++){
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      delay_ms(100);
    }
    for(contador = 0; contador < 16; contador++){
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      delay_ms(100);
    }
  }
}