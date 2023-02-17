#include <main.h>

#include <KBD.C>

#define LCD_DATA_PORT getenv("SFR:PORTB")
#include <lcd.c>

char tecla;

void main()
{
   kbd_init();

   lcd_init();
   
   printf(lcd_putc, "\fDigite: ");
   delay_ms(300);

   while(TRUE)
   {
      
      tecla = kbd_getc();
      delay_ms(2);
      
      if(tecla != 0)
      {
         lcd_gotoxy(9,1);
         printf(lcd_putc, "%c", tecla);
         delay_ms(300);
      }
      
   }

}
