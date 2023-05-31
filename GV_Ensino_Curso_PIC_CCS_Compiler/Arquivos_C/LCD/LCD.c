#include <LCD.h>
#define LCD_ENABLE_PIN PIN_B0
#define LCD_RS_PIN PIN_B1
#define LCD_RW_PIN PIN_B2
#define LCD_DATA4 PIN_B4
#define LCD_DATA5 PIN_B5
#define LCD_DATA6 PIN_B6
#define LCD_DATA7 PIN_B7

#include <lcd.c>

int heart[8] = { // caractere na CGRAM
   0b00000,
   0b00000,
   0b01010,
   0b10101,
   0b10001,
   0b01010,
   0b00100,
   0b00000
};


void main()
{

   lcd_init(); // inicalizando o Display LCD
   
   lcd_set_cgram_char(0, heart); // configurando um caractere na posi��o 0 da CGRAM
   
   printf(lcd_putc, "\f");
   printf(lcd_putc, "  ABMS Telecom  ");
   printf(lcd_putc, "\r\n");
   
   // \f - limpa o display
   // \r - retorno de carro
   // \n - pula linha

   printf(lcd_putc, "   Bem Vindo!   ");
   
   delay_ms(2000);

   while(TRUE)
   {
      //TODO: User Code
      printf(lcd_putc, "\f");
      lcd_gotoxy(26,1);
      printf(lcd_putc, "Marcelo");
      lcd_gotoxy(29,2);
      printf(lcd_putc, "%c", 0); // usando o caractere 0 da CGRAM
      delay_ms(500);
      printf(lcd_putc, "\f");
      delay_ms(500);
      
   }

}
