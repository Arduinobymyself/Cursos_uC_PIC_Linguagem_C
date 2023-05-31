#include <main.h>

#define use_portb_kbd TRUE
#include <KBD.C>


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
