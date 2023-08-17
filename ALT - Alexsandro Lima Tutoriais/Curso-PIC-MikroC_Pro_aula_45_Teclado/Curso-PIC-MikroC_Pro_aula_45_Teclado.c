


// Lcd pinout settings
sbit LCD_RS at RD3_bit;
sbit LCD_EN at RD2_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD3_bit;
sbit LCD_EN_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;



void main() {
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  ADCON1 = 0xFF;
  TRISB = 0xF0;
  PORTB = 0xFF;
  TRISA = 0x00;
  PORTA = 0x00;
  
  while(1){
  
    PORTB = 0b00000001;
    if(PORTB.RB4 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 1");
      delay_ms(200);
    }
    if(PORTB.RB5 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 4");
      delay_ms(200);
    }
    if(PORTB.RB6 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 7");
      delay_ms(200);
    }
    if(PORTB.RB7 == 1){
      PORTA.RA0 = 1;
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla *");
      delay_ms(200);
    }

    
    PORTB = 0b00000010;
    if(PORTB.RB4 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 2");
      delay_ms(200);
    }
    if(PORTB.RB5 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 5");
      delay_ms(200);
    }
    if(PORTB.RB6 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 8");
      delay_ms(200);
    }
    if(PORTB.RB7 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 0");
      delay_ms(200);
    }

    
    PORTB = 0b00000100;
    if(PORTB.RB4 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 3");
      delay_ms(200);
    }
    if(PORTB.RB5 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 6");
      delay_ms(200);
    }
    if(PORTB.RB6 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla 9");
      delay_ms(200);
    }
    if(PORTB.RB7 == 1){
      PORTA.RA0 = 0;
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla #");
      delay_ms(200);
    }
    
    PORTB = 0b00001000;
    if(PORTB.RB4 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla A");
      delay_ms(200);
    }
    if(PORTB.RB5 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla B");
      delay_ms(200);
    }
    if(PORTB.RB6 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla C");
      delay_ms(200);
    }
    if(PORTB.RB7 == 1){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out_CP(" Tecla D");
      delay_ms(200);
    }

    
  }

}