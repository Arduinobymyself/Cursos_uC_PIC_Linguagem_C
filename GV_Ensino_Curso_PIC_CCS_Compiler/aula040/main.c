#include <main.h>

#include <lcd.c>


int heart[8] = {
   0b00000,
   0b00000,
   0b01010,
   0b11111,
   0b11111,
   0b01110,
   0b00100,
   0b00000
};




void main()
{

   lcd_init();
   lcd_set_cgram_char(0, heart);

   while(TRUE)
   {
      /*
      printf(lcd_putc, "\f");
      lcd_gotoxy(1, 2);
      printf(lcd_putc, "    ABMS Telecom");
      lcd_gotoxy(21, 1);
      printf(lcd_putc, "     Bem vindo!");
      lcd_gotoxy(21, 2);
      printf(lcd_putc, "      %c voce!", 0);
      delay_ms(400);
      */
      
      
      
   }

}
