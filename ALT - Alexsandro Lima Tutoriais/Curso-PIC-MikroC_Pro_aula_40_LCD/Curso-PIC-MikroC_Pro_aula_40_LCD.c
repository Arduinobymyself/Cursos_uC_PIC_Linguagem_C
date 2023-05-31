// Curso PIC MikroC Pro
// Alexsandro Lima
// YouTube
// Aula 40a - LCD+Botão+LED

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

bit estado;

void main() {
  TRISB.RB7 = 0;
  TRISA.RB0 = 1;
  PORTB.RB7 = 0;
  PORTA.RA0 = 0;
  
  Lcd_Init();// inicializa o LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);// não mostrar o cursor
  
  Lcd_Out(1,1,"ArduinoByMySelf     "); // apresenta mensagem Inicial
  
  // pisca LED, exibe mensagem
  while(1){
    if(Button(&PORTA, 0, 50, 0) && (estado == 0)){// se RA0 pressionado e estado = 0
      Lcd_Out(2,1,"BOTAO PRESSIONADO   ");
      PORTB.RB7 = ~PORTB.RB7;// inverte estado do LED
      estado = 1;// faz estado = 1
    }
    if(!Button(&PORTA, 0, 50, 0) && (estado == 1)){// se RA0 não pressionado e estado = 1; soltou botão...
      Lcd_Out(2,1,"BOTAO LIBERADO      ");
      estado = 0;//faz estado = 0
    }
  }
}