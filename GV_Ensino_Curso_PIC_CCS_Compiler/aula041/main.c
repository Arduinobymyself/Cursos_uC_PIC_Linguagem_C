#include <main.h>

#include <lcd.c>

char battery0[7] = {
   0b01110,
   0b10001,
   0b10001,
   0b10001,
   0b10001,
   0b10001,
   0b11111
};

char battery1[7] = {
   0b01110,
   0b10001,
   0b10001,
   0b10001,
   0b10001,
   0b11111,
   0b11111
};

char battery2[7] = {
   0b01110,
   0b10001,
   0b10001,
   0b10001,
   0b11111,
   0b11111,
   0b11111
};

char battery3[7] = {
   0b01110,
   0b10001,
   0b10001,
   0b11111,
   0b11111,
   0b11111,
   0b11111
};

char battery4[7] = {
   0b01110,
   0b10001,
   0b11111,
   0b11111,
   0b11111,
   0b11111,
   0b11111
};

char battery5[7] = {
   0b01110,
   0b11111,
   0b11111,
   0b11111,
   0b11111,
   0b11111,
   0b11111
};

int i;

void main()
{

   lcd_init();
   lcd_set_cgram_char(0, battery0);
   lcd_set_cgram_char(1, battery1);
   lcd_set_cgram_char(2, battery2);
   lcd_set_cgram_char(3, battery3);
   lcd_set_cgram_char(4, battery4);
   lcd_set_cgram_char(5, battery5);

   while(TRUE)
   {

      // animação de bateria carga e descarga de bateria
      i = 0;
      do
      {
         printf(lcd_putc, "\f%c", i);
         delay_ms(300);
         i++;
      } while(i < 6);
      
      i = 5;
      do
      {
         printf(lcd_putc, "\f%c", i);
         delay_ms(300);
         i--;
      } while(i != 0);
          
   }

}
